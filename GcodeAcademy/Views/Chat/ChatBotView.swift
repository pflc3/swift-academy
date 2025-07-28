import SwiftUI

struct ChatBotView: View {
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            // Message display area
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Hi! I'm the Gcode Helper Bot. How can I assist you?")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()
            }
            
            // Input field
            HStack {
                TextField("Type a message...", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: {
                    // Send message functionality will go here
                }) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 30))
                }
            }
            .padding()
        }
    }
}

#Preview {
    ChatBotView()
}
