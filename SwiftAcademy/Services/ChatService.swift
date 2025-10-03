// ChatService.
// Responsible for sending chat conversation payloads to the server and returning responses.
// Maps in-memory ChatTurn values to API DTOs and provides friendly error messages.

import Foundation

/// Service responsible for sending chat conversation payloads to the backend.
/// Maps local `ChatTurn` values to API DTOs and returns the assistant response text.
final class ChatService: ObservableObject {
    let baseURL: String
    init(baseURL: String) { self.baseURL = baseURL }

    /// Send a sequence of chat turns to the backend and return the assistant reply.
    /// - Parameters:
    ///   - messages: Conversation turns in order (user/assistant).
    ///   - userId: Optional user identifier forwarded to the API.
    ///   - context: Optional contextual metadata sent with the request.
    /// - Returns: The assistant's response text trimmed of surrounding whitespace.
    func send(
        messages: [ChatTurn],
        userId: String? = nil,
        context: [String: String]? = nil
    ) async throws -> String {
        // Fail fast when the base URL is invalid to avoid unnecessary work.
        guard let url = URL(string: "\(baseURL)/chat") else { throw URLError(.badURL) }

        // Map in-memory turns to the network message shape.
        let apiMessages = messages.map {
            APIMessage(role: $0.role == .user ? "user" : "assistant", content: $0.content)
        }
        let body = ChatRequest(messages: apiMessages, userId: userId, context: context)

        // Build request with JSON body and proper headers.
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONEncoder().encode(body)

        // Perform the request and validate the HTTP status code.
        let (data, resp) = try await URLSession.shared.data(for: req)
        guard let http = resp as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        // Decode the expected response shape and trim incidental whitespace.
        let decoded = try JSONDecoder().decode(ChatResponse.self, from: data)
        return decoded.message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Convert common networking errors into short, user-facing messages.
    static func friendlyMessage(_ error: Error) -> String {
        if let err = error as? URLError {
            switch err.code {
            case .notConnectedToInternet, .cannotConnectToHost, .cannotFindHost,
                 .networkConnectionLost, .dnsLookupFailed:
                return "Coach is offline right now. Please try again shortly."
            case .timedOut:
                return "Coach took too long to respond — let’s try that again."
            case .badServerResponse:
                return "Server error. Please try again."
            default:
                break
            }
        }
        return "Something went wrong. Please try again."
    }
}
