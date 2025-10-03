// SwiftAcademy Views - Chat input section.
// Text field and send button used at the bottom of the chat screen.
// Disables sending while loading or when the message is empty.
import SwiftUI

struct ChatInputSection: View {
    @Binding var message: String
    let isLoading: Bool
    var onSend: () -> Void

    var body: some View {
        HStack {
            // Text input field
            TextField("Type a message. . .", text: $message)
                .padding(12)
                .background(Color.surfaceApp)
                .cornerRadius(20)

            // Send button
            Button(action: onSend) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 30))
                    // Change color based on whether the button is enabled
                    .foregroundColor(message.isEmpty ? .dividerApp : .primaryApp)
            }
            // Disable button when there's no message or we're loading
            .disabled(message.isEmpty || isLoading)
        }
        .padding()
        .background(Color.cardBackgroundApp)
    }
}

#Preview {
    VStack {
        // Preview with empty message
        ChatInputSection(
            message: .constant(""),
            isLoading: false
        ) {}

        // Preview with text and loading state
        ChatInputSection(
            message: .constant("hello there"),
            isLoading: true
        ) {}
    }
}
