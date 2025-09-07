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
    let userMsg = "Hello! Can you help me understand Swift protocols?"
    let botMsg = """
    Of course! Swift protocols define a blueprint of methods, properties, \
    and requirements that suit a particular task or piece of functionality.
    """
    return VStack {
        ChatBubble(message: ChatMessage(content: userMsg, isFromUser: true))
        ChatBubble(message: ChatMessage(content: botMsg, isFromUser: false))
    }
    .padding()
}
