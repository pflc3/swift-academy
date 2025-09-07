import Foundation

@MainActor
final class AppDependencies {
    let userService: UserService
    let session: SessionManager
    let chatService: ChatService
    let toasts: ToastCenter

    init() {
        self.userService = UserService()
        self.session = SessionManager(userService: self.userService)
        self.chatService = ChatService(baseURL: "http://localhost:8000/api/v1")
        self.toasts = ToastCenter()
    }
}
