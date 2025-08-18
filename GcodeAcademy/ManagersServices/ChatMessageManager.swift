/*
 * Manages state for chat messages in the frontend.
 *
 * Holds current conversation
 * Sends new user messages to ChatService
 * Updates UI with assistant responses or error messages
 */

import Foundation
import SwiftUI

class ChatMessageManager: ObservableObject {
    // Conversation history, seeded with a greeting
    @Published var messages: [ChatMessage] = [
        ChatMessage(
            content: "Hi! I'm your Code Coach, your AI tutor for CS and iOS dev. How can I help with your coding questions today?",
            isFromUser: false
        )
    ]
    @Published var isLoading = false        // Controls typing indicator
    @Published var newMessage: String = ""  // Current input field contents

    private let chatService = ChatService()

    // Send the user's message to the backend and update conversation state
    func sendMessage() {
        guard !newMessage.isEmpty && !isLoading else { return }

        // Add user's message to the local conversation
        let userMessage = ChatMessage(content: newMessage, isFromUser: true)
        messages.append(userMessage)
        newMessage = ""
        isLoading = true

        // Forward full history to the backend (no prompt injection here — backend owns it)
        let messagesToSend = messages

        chatService.sendMessage(messages: messagesToSend) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false

                switch result {
                case .success(let response):
                    // Add assistant’s reply to conversation
                    self.messages.append(ChatMessage(content: response, isFromUser: false))

                case .failure:
                    // Minimal fallback error — backend will handle friendly copy when reachable
                    self.messages.append(
                        ChatMessage(content: "Something went wrong. Please try again.", isFromUser: false)
                    )
                }
            }
        }
    }
}
