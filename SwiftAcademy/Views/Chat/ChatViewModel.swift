import Foundation

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = [
        ChatMessage(
            content: "Hi! I'm your Code Coach, your AI tutor for CS and iOS dev. How can I help with your coding questions today?",
            isFromUser: false
        )
    ]
    @Published var newMessage: String = ""
    @Published var isLoading = false

    private var session: SessionManager?
    private var chatService: ChatService?
    private var toasts: ToastCenter?
    private(set) var isConfigured = false

    func configure(session: SessionManager, chatService: ChatService, toasts: ToastCenter) {
        guard !isConfigured else { return }
        self.session = session
        self.chatService = chatService
        self.toasts = toasts
        isConfigured = true
    }

    func send() {
        guard !newMessage.isEmpty, !isLoading, isConfigured else { return }
        let userMsg = ChatMessage(content: newMessage, isFromUser: true)
        messages.append(userMsg)
        newMessage = ""
        isLoading = true

        if AppMode.useMocks {
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
