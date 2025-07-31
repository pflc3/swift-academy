import SwiftUI

// Provides an input field and send button for typing and sending messages
struct ChatInputSection: View {
    var body: some View {
        HStack {
            Text("Message Input Placeholder")
                .padding()
                .background(Color.surfaceApp)
                .cornerRadius(8)
        }
        .padding()
        .background(Color.cardBackgroundApp)
    }
}

#Preview {
    ChatInputSection()
}
