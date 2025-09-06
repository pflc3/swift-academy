import SwiftUI

struct ChatBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isFromUser { Spacer() }

            VStack(alignment: message.isFromUser ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(12)
                    .background(message.isFromUser ? Color.primaryApp : Color.surfaceApp)
                    .foregroundColor(message.isFromUser ? .white : .textPrimaryApp)
                    .cornerRadius(16)
                    .cornerRadius(message.isFromUser ? 2 : 16, corners: .topRight)
                    .cornerRadius(message.isFromUser ? 16 : 2, corners: .topLeft)
            }
            .padding(.horizontal, 4)

            if !message.isFromUser { Spacer() }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

#Preview {
    VStack {
        ChatBubble(message: ChatMessage(content: "Hello! Can you help me understand Swift protocols?", isFromUser: true))
        ChatBubble(message: ChatMessage(content: "Of course! Swift protocols define a blueprint of methods, properties, and requirements that suit a particular task or piece of functionality.", isFromUser: false))
    }
    .padding()
}
