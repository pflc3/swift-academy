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
                content: "You are the Code Coach, an educational AI tutor specializing in computer science concepts and iOS development. Your goal is to help high school and early college students learn programming. Provide clear, concise explanations with code examples when helpful. Use a friendly, encouraging tone and break down complex concepts into simple terms. If appropriate, reference visual learning and practical applications.",
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
