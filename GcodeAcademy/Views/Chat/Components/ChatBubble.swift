import SwiftUI

// Displays a single chat mesaage with appropriate styling based on sender
struct ChatBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            // If message is from the user, push it to the right
            if message.isFromUser {
                Spacer()
            }
            
            // Message content
            VStack(alignment: message.isFromUser ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(12)
                    // Different colors based on sender
                    .background(message.isFromUser ? Color.primaryApp : Color.surfaceApp)
                    .foregroundColor(message.isFromUser ? .white : .textPrimaryApp)
                    .cornerRadius(16)
                    // Create chat bubble shape by adjusting corner radius
                    .cornerRadius(message.isFromUser ? 2 : 16, corners: .topRight)
                    .cornerRadius(message.isFromUser ? 16 : 2, corners: .topLeft)
            }
            .padding(.horizontal, 4)
            
            // If message is from the assistant, push it to the left
            if !message.isFromUser {
                Spacer()
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

// Helper to allow different corner radii on different corners
extension View {
    func cornerRadius( _ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// Custom shape that allows rounding only certain corners
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        // Create a UIBezierPath with the specified corners rounded
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    VStack {
        // Preview with both user and assistant messages
        ChatBubble(message: ChatMessage(content: "Hello! Can you help me understand Swift protocols?", isFromUser: true))
        ChatBubble(message: ChatMessage(content: "Of course! Swift protocols define a blueprint of methods, properties, and requirements that suit a particular task or piece of functionality", isFromUser: false))
    }
            .padding()
}
