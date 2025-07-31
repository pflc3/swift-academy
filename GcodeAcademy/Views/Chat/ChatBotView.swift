import SwiftUI

// Main view for the chat interface
struct ChatBotView: View {
    var body: some View {
        // Simply display the content view
        ChatContentView()
            .navigationTitle("Gcode Helper")
    }
}

#Preview {
    NavigationStack {
        ChatBotView()
    }
}
