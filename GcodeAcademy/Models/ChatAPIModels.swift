// Models for API communication with the chat backend

import Foundation

// Represents a single message in the API format
struct APIMessage: Codable {
    let role: String  // "user" or "assistant"
    let content: String
}

// Request body for sending messages to the API
struct ChatRequest: Codable {
    let messages: [APIMessage]
    let userId: String?
    let context: [String: String]?
    
    enum CodingKeys: String, CodingKey {
        case messages
        case userId = "user_id" // Maps to snake_case in JSON
        case context
        }
    }

// Response from the chat API
struct ChatResponse: Codable {
    let message: APIMessage
}
