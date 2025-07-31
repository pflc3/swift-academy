import Foundation
import SwiftUI

// Manages chat message state and communication with the AI backend
class ChatMessageManager: ObservableObject {
    // Current messages in the chat
    @Published var messages: [ChatMessage] = [
        ChatMessage(
            content: "Hi! I'm the Gcode Helper Bot. How can I assist you with your programming questions?",
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
        
        // Get message content and clear input field
        let messageToSend = newMessage
        newMessage = ""
        
        // Show loading indicator
        isLoading = true
        
        // Add system message for context if this is the first user message
        var messagesToSend = messages
        if messages.count == 2 && messages[0].isFromUser == false && messages[1].isFromUser == true {
            let systemMessage = ChatMessage(
                content: "You are a helpful programming tutor specializing in Swift and iOS development. Provide clear, concise explanations with examples when helpful.",
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
                        content: "Sorry, I'm having trouble responding right now. Please try again later. Error: \(error.localizedDescription)",
                        isFromUser: false
                    )
                    self.messages.append(errorMessage)
                }
            }
        }
    }
}
