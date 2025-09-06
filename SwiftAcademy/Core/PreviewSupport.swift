import SwiftUI

@MainActor
struct PreviewDeps {
    let userService: UserService
    let session: SessionManager
    let chatService: ChatService
    let toasts: ToastCenter

    init(user: UserProfile? = MockData.users.first) {
        userService = UserService()
        session = SessionManager(userService: userService)
        session.isBootstrapping = false
        session.isAuthenticated = (user != nil)
        session.user = user
        chatService = ChatService(baseURL: "http://localhost:8000/api/v1")
        toasts = ToastCenter()
    }
}

@MainActor
extension View {
    func previewEnv(_ deps: PreviewDeps) -> some View {
        self
            .environmentObject(deps.session)
            .environmentObject(deps.userService)
            .environmentObject(deps.chatService)
            .environmentObject(deps.toasts)
    }
}
