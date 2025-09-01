/*
 * Represents a message in the local chat UI (frontend only).
 * Separate from APIMessage, which is the wire format.
 */

import Foundation

struct ChatMessage: Identifiable {
    var id = UUID()
    var content: String
    var isFromUser: Bool
    var timestamp: Date = Date()
    var isLoading: Bool = false  // For typing indicator, if needed

    // Convert to API role string
    var apiRole: String { isFromUser ? "user" : "assistant" }
}
