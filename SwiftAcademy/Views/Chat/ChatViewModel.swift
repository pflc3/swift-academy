// ChatViewModel.
// Manages chat message list, sending flow, and loading state for the chat UI.
// Bridges view events to `ChatService` and exposes friendly errors for display.

import Foundation

/// View model for the chat UI. Manages messages, send flow, and loading state.
/// Delegates network calls to `ChatService` and exposes friendly errors for display.
@MainActor
final class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = [
        ChatMessage(
            content: """
            Hi! I'm your Code Coach, your AI tutor for CS and iOS dev. \
            How can I help with your coding questions today?
            """,
            isFromUser: false
        )
    ]
    @Published var newMessage: String = ""
    @Published var isLoading = false

    private var session: SessionManager?
    private var chatService: ChatService?
    private var toasts: ToastCenter?
    private(set) var isConfigured = false

    /// Configure the view model with runtime collaborators required for sending messages.
    func configure(session: SessionManager, chatService: ChatService, toasts: ToastCenter) {
        guard !isConfigured else { return }
        self.session = session
        self.chatService = chatService
        self.toasts = toasts
        isConfigured = true
    }

    /// Send the current `newMessage` to the chat backend and append the reply.
    /// Appends a local message immediately and updates `isLoading` while awaiting reply.
    func send() {
        guard !newMessage.isEmpty, !isLoading, isConfigured else { return }
        let userMsg = ChatMessage(content: newMessage, isFromUser: true)
        messages.append(userMsg)
        newMessage = ""
        isLoading = true

        if AppMode.useMocks {
            // Return a short mocked assistant reply for previews and tests.
            messages.append(ChatMessage(content: "This is a mocked response", isFromUser: false))
            isLoading = false
            return
        }

        let turns = messages.map { ChatTurn(role: $0.isFromUser ? .user : .assistant, content: $0.content) }
        let userId = session?.user?.uid

        Task {
            do {
                guard let reply = try await chatService?.send(messages: turns, userId: userId, context: nil) else {
                    throw NSError(domain: "Chat", code: -1, userInfo: [NSLocalizedDescriptionKey: "No response"])
                }
                messages.append(ChatMessage(content: reply, isFromUser: false))
            } catch {
                messages.append(ChatMessage(content: ChatService.friendlyMessage(error), isFromUser: false))
                isLoading = false
            }
            isLoading = false
        }
    }
}
