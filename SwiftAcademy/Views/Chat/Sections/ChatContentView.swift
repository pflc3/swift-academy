// Chat content container.
// Composes the messages list and input sections into the full chat UI.

import SwiftUI

struct ChatContentView: View {
    // Bindings to state managed by the parent view
    @Binding var messages: [ChatMessage]
    @Binding var newMessage: String
    @Binding var isLoading: Bool

    // Callback for when the user wants to send a message
    var onSendMessage: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            // Messages list section
            ChatMessagesSection(
                messages: $messages,
                isLoading: $isLoading
            )

            // Divider between messages and input
            Rectangle()
                .fill(Color.dividerApp)
                .frame(height: 1)

            // Input field section
            ChatInputSection(
                message: $newMessage,
                isLoading: isLoading,
                onSend: onSendMessage
            )
        }
    }
}

#Preview {
    ChatContentView(
        messages: .constant([
            ChatMessage(content: "Hi! How can I help you?", isFromUser: false),
            ChatMessage(content: "I need help with SwiftUI", isFromUser: true)
        ]),
        newMessage: .constant(""),
        isLoading: .constant(false)
    ) {}
}
