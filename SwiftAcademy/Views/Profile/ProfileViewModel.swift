import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var name: String
    @Published var bio: String

    private let session: SessionManager
    private let userService: UserService
    private let toasts: ToastCenter

    init(session: SessionManager, userService: UserService, toasts: ToastCenter) {
        self.session = session
        self.userService = userService
        self.toasts = toasts
        let user = session.user
        self.name = user?.name ?? ""
        self.bio  = user?.bio  ?? ""
    }

    var email: String { session.user?.email ?? "" }

    func save() async {
        guard let uid = session.user?.uid else {
            toasts.show("Not logged in", positive: false)
            return
        }

        if AppMode.useMocks {
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
