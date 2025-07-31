import SwiftUI

// Main view for the chat interface
struct ChatBotView: View {
    // Manager for chat state and business logic
    @StateObject private var chatManager = ChatMessageManager()
    
    var body: some View {
        // Use our ChatContentView component as the main container
        ChatContentView(
            messages: $chatManager.messages,
            newMessage: $chatManager.newMessage,
            isLoading: $chatManager.isLoading,
            onSendMessage: chatManager.sendMessage
        )
        .navigationTitle("Gcode Helper")
    }
}

#Preview {
    NavigationStack {
        ChatBotView()
    }
}
