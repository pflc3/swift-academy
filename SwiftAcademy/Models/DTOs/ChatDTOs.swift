// Chat API DTOs.
// Data transfer objects used to serialize chat requests and responses to the backend.
// Keeps network types separate from local ChatMessage models.

import Foundation

struct APIMessage: Codable {
    let role: String
    let content: String
}

struct ChatRequest: Codable {
    let messages: [APIMessage]
    let userId: String?
    let context: [String: String]?
    enum CodingKeys: String, CodingKey { case messages, context, userId = "user_id" }
}

struct ChatResponse: Codable {
    let message: APIMessage
}
