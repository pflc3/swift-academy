// SwiftAcademy Services - ChatService.
// Responsible for sending chat conversation payloads to the server and returning responses.
// Maps in-memory ChatTurn values to API DTOs and provides friendly error messages.
import Foundation

final class ChatService: ObservableObject {
    let baseURL: String
    init(baseURL: String) { self.baseURL = baseURL }

    func send(
        messages: [ChatTurn],
        userId: String? = nil,
        context: [String: String]? = nil
    ) async throws -> String {
        guard let url = URL(string: "\(baseURL)/chat") else { throw URLError(.badURL) }

        let apiMessages = messages.map {
            APIMessage(role: $0.role == .user ? "user" : "assistant", content: $0.content)
        }
        let body = ChatRequest(messages: apiMessages, userId: userId, context: context)

        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONEncoder().encode(body)

        let (data, resp) = try await URLSession.shared.data(for: req)
        guard let http = resp as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(ChatResponse.self, from: data)
        return decoded.message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

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
