import Foundation
import SwiftUI

// Manages chat message state and communication with the AI backend
class ChatMessageManager: ObservableObject {
    // Current messages in the chat
    @Published var messages: [ChatMessage] = [
        ChatMessage(
            content: "Hi! I'm your Code Coach, your AI tutor for CS and iOS dev. How can I help with your coding questions today?",
            isFromUser: false
        )
    ]
    
    // Whether the AI is currently generating a response
    @Published var isLoading = false
    
    // Text being typed by the user
    @Published var newMessage: String = ""
    
    // Service for API communication
    private let chatService = ChatService()
    
    // Sends a message to the AI and processes the response
    func sendMessage() {
        // Don't send empty messages or while loading
        guard !newMessage.isEmpty && !isLoading else { return }
        
        // Add user message to the chat
        let userMessage = ChatMessage(content: newMessage, isFromUser: true)
        messages.append(userMessage)
        
        // Clear input field
        newMessage = ""
        
        // Show loading indicator
        isLoading = true
        
        // Add system message for context if this is the first user message
        var messagesToSend = messages
        if messages.count == 2 && messages[0].isFromUser == false && messages[1].isFromUser == true {
            let systemMessage = ChatMessage(
                content: """
                You are the Code Coach - a friendly, helpful AI mentor built to teach computer science with a focus on Swift, SwiftUI, and iOS development using Xcode. Most students you support are beginners: high schoolers, early college students, or anyone new to programming.

                Your job is to explain coding concepts in a simple, beginner-friendly way. Always use plain text only - no markdown formatting (no asterisks for bold, no triple backticks for code blocks, etc.).

                Keep your answers short, clear, and focused on the question being asked. Don’t over-explain or drift off-topic. Avoid technical jargon unless you explain it clearly. Use real-world comparisons, metaphors, or visual descriptions when they help. Include small, inline code examples if useful — just make sure they’re easy to read in plain text.

                If the question is broad or connects to a bigger topic, still keep your answer concise, but feel free to suggest next steps by saying something like: "You might also want to learn about ___. Want me to explain that too?"

                Maintain a warm, encouraging tone — like a patient mentor who wants students to feel confident and truly understand the material.
                """,
                isFromUser: false
            )
            messagesToSend = [systemMessage] + messagesToSend
        }
        
        // Send to API and handle response
        chatService.sendMessage(messages: messagesToSend) { [weak self] result in
            // Update UI on main thread
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                self.isLoading = false
                
                switch result {
                case .success(let response):
                    // Add bot response to the chat
                    let botMessage = ChatMessage(content: response, isFromUser: false)
                    self.messages.append(botMessage)
                    
                case .failure(let error):
                    // Add error message to the chat
                    let errorMessage = ChatMessage(
                        content: "Oops! Connection issue detected. Please check your internet, refresh, or try again shortly.\n\nTechnical details: \(error.localizedDescription)",
                        isFromUser: false
                    )
                    self.messages.append(errorMessage)
                }
            }
        }
    }
}
