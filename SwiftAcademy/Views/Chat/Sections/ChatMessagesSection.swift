import SwiftUI

// Displays a scrollable list of chat messages
struct ChatMessagesSection: View {
    @Binding var messages: [ChatMessage]
    @Binding var isLoading: Bool
    
    var body: some View {
        // Use ScrollViewReader to control scrolling position
        ScrollViewReader { scrollView in
            ScrollView {
                LazyVStack {
                    // Display all messages using ChatBubble component
                    ForEach(messages) { message in
                        ChatBubble(message: message)
                            .id(ChatViewID.message(message.id))
                    }
                    
                    // Show typing indicator when loading
                    if isLoading {
                        HStack {
                            TypingIndicator()
                            Spacer()
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .id(ChatViewID.loading)
                    }
                }
                .padding(.vertical)
            }
            .background(Color.backgroundApp)
            // Scroll to the latest message when message count changes
            .onChange(of: messages.count) {
                withAnimation {
                    if let lastID = messages.last?.id {
                        scrollView.scrollTo(ChatViewID.message(lastID), anchor: .bottom)
                    }
                }
            }
            // Scroll when loading state changes
            .onChange(of: isLoading) {
                withAnimation {
                    if isLoading {
                        // Scroll to typing indicator when loading starts
                        scrollView.scrollTo(ChatViewID.loading, anchor: .bottom)
                    } else if let lastID = messages.last?.id {
                        // Scroll to last message when loading ends
                        scrollView.scrollTo(ChatViewID.message(lastID), anchor: .bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    ChatMessagesSection(
        messages: .constant([
            ChatMessage(content: "Hello! I'm the Gcode Helper Bot.", isFromUser: false),
            ChatMessage(content: "Can you help me with Swift?", isFromUser: true)
        ]),
        isLoading: .constant(true)
    )
    .frame(height: 300)
}
