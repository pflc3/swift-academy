/*
 * Simple data transfer objects (DTOs) for API requests/responses.
 * These structs only define shape of JSON, no logic.
 */

import Foundation

// API-ready message format
struct APIMessage: Codable {
    let role: String  // "user" or "assistant"
    let content: String
}

// Request payload for /chat
struct ChatRequest: Codable {
    let messages: [APIMessage]
    let userId: String?
    let context: [String: String]?

    enum CodingKeys: String, CodingKey {
        case messages
        case userId = "user_id"
        case context
    }
}

// Response payload from /chat
struct ChatResponse: Codable {
    let message: APIMessage
}
