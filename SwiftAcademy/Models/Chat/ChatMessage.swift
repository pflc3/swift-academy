// SwiftAcademy Models - ChatMessage.
// UI model representing a chat message in the conversation list, including loading state.
// Provides convenience properties for mapping to API role and display timestamps.
import Foundation

struct ChatMessage: Identifiable {
    var id = UUID()
    var content: String
    var isFromUser: Bool
    var timestamp: Date = Date()
    var isLoading: Bool = false
    var apiRole: String { isFromUser ? "user" : "assistant" }
}
