import Foundation

struct ChatMessage: Identifiable {
    var id = UUID()
    var content: String
    var isFromUser: Bool
    var timestamp: Date = Date()
    
    // For displaying loading state
    var isLoading: Bool = false
    
    // Convert to the format expected by the API
    var apiRole: String {
        return isFromUser ? "user" : "assistant"
    }
}
