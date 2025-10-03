// Application dependency container.
// Holds app-wide services and managers for injection into views and view models.
// Centralizes construction of UserService, SessionManager, ChatService, and ToastCenter.

import Foundation

/// Simple dependency container that constructs core app services.
/// Designed for easy injection into SwiftUI views and previews.
@MainActor
final class AppDependencies {
    let userService: UserService
    let session: SessionManager
    let chatService: ChatService
    let toasts: ToastCenter

    init() {
        // Construct lightweight services. Avoid side effects here.
        self.userService = UserService()
        self.session = SessionManager(userService: self.userService)
        self.chatService = ChatService(baseURL: "http://localhost:8000/api/v1")
        self.toasts = ToastCenter()
    }
}
