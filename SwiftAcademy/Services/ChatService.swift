import Foundation

final class ChatService: ObservableObject {
    private let baseURL: String
    init(baseURL: String) { self.baseURL = baseURL }
    
    func send(messages: [ChatTurn], userId: String? = nil, context: [String: String]? = nil) async throws -> String {
        let apiMessages = messages.map { APIMessage(role: ($0.role == .user ? "user" : "assistant"), content: $0.content) }
        let body = ChatRequest(messages: apiMessages, userId: userId, context: context)
        guard let url = URL(string: "\(baseURL)/chat") else { throw URLError(.badURL) }
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONEncoder().encode(body)
        let (data, resp) = try await URLSession.shared.data(for: req)
        guard let http = resp as? HTTPURLResponse, 200..<300 ~= http.statusCode else { throw URLError(.badServerResponse) }
        let decoded = try JSONDecoder().decode(ChatResponse.self, from: data)
        return decoded.message.content
    }
}
