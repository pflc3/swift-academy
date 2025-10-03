// Chat API DTOs.
// Data transfer objects used to serialize chat requests and responses to the backend.
// Keeps network types separate from local ChatMessage models.

import Foundation

/// Network DTO representing a single message payload exchanged with the chat API.
struct APIMessage: Codable {
    let role: String
    let content: String
}

/// Request payload sent to the chat backend. Keeps keys stable via `CodingKeys`.
struct ChatRequest: Codable {
    let messages: [APIMessage]
    let userId: String?
    let context: [String: String]?
    enum CodingKeys: String, CodingKey { case messages, context, userId = "user_id" }
}

/// Minimal response wrapper expected from the chat backend.
struct ChatResponse: Codable {
    let message: APIMessage
}
