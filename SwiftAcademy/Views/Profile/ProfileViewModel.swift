// ProfileViewModel.
// View model used by the edit profile screen to persist changes and perform logout.
// Bridges `UserService` writes and local session updates for the UI.

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var name: String
    @Published var bio: String

    private let session: SessionManager
    private let userService: UserService
    private let toasts: ToastCenter

    /// Initialize view model from the current session and services.
    /// Copies user fields into editable local properties used by the UI.
    init(session: SessionManager, userService: UserService, toasts: ToastCenter) {
        self.session = session
        self.userService = userService
        self.toasts = toasts
        let user = session.user
        self.name = user?.name ?? ""
        self.bio  = user?.bio  ?? ""
    }

    var email: String { session.user?.email ?? "" }

    /// Persist profile edits to Firestore (or apply locally in mock mode).
    func save() async {
        guard let uid = session.user?.uid else {
            toasts.show("Not logged in", positive: false)
            return
        }

        if AppMode.useMocks {
            // Apply edits locally for previews and tests without a network write.
            session.user?.name = name
            session.user?.bio  = bio
            return
        }

        do {
            try await userService.updateProfile(uid: uid, name: name, bio: bio)
            session.user?.name = name
            session.user?.bio  = bio
        } catch {
            toasts.show("Failed to save profile", positive: false)
        }
    }

    /// Perform logout via `UserService` or clear session in mock mode.
    func logout() {
        if AppMode.useMocks {
            // session.user = nil, causes preview to go blank since no more user data
            session.isAuthenticated = false
            return
        }

        do {
            try userService.logout()
        } catch {
            toasts.show("Failed to log out", positive: false)
        }
    }
}
