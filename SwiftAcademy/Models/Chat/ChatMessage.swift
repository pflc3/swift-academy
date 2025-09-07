import Foundation

struct ChatMessage: Identifiable {
    var id = UUID()
    var content: String
    var isFromUser: Bool
    var timestamp: Date = Date()
    var isLoading: Bool = false
    var apiRole: String { isFromUser ? "user" : "assistant" }
}
