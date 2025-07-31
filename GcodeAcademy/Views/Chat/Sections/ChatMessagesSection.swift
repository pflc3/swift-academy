import SwiftUI

// Displays a scrollable list of chat messages
struct ChatMessagesSection: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Sample placeholder message
                Text("Message Placeholder")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.surfaceApp)
                    .cornerRadius(8)
            }
            .padding()
        }
        .background(Color.backgroundApp)
    }
}

#Preview {
    ChatMessagesSection()
        .frame(height: 300)
}
