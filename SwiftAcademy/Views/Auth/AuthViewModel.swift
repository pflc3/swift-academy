// AuthViewModel.
// Manages auth screen state, form fields, and performs sign-in/sign-up flows.
// Bridges UI events to `UserService` and updates the session accordingly.

import Foundation

enum AuthScreen { case welcome, signin, create }

@MainActor
/// View model for the authentication screens. Handles form state and coordinates
/// sign-in and sign-up flows using `UserService` and `SessionManager`.
final class AuthViewModel: ObservableObject {
    @Published var currentView: AuthScreen = .welcome
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var name = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var session: SessionManager?
    private var userService: UserService?
    private var toasts: ToastCenter?
    private(set) var isConfigured = false

    /// Configure the view model with required runtime collaborators.
    func configure(session: SessionManager, userService: UserService, toasts: ToastCenter) {
        guard !isConfigured else { return }
        self.session = session
        self.userService = userService
        self.toasts = toasts
        isConfigured = true
    }

    /// Attempt to sign in the user with the provided credentials.
    /// Updates `session` on success and sets `errorMessage` on failure.
    func login() {
        guard let session, let userService else { return }
        isLoading = true
        errorMessage = nil
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password"
            isLoading = false
            return
        }

        if AppMode.useMocks {
            session.user = MockData.users.first
            session.isAuthenticated = true
            isLoading = false
            return
        }

        Task {
            do {
                let profile = try await userService.login(email: email, password: password)
                session.user = profile
                session.isAuthenticated = true
            } catch {
                // Show a user-friendly error message returned from the auth layer.
                // Keep messages concise for the UI.
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }

    /// Register a new user account and load the created profile.
    /// Validates form fields before calling `UserService.signup`.
    func signup() {
        guard let session, let userService else { return }
        isLoading = true
        errorMessage = nil
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Please fill in all fields"
            isLoading = false
            return
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            isLoading = false
            return
        }

        if AppMode.useMocks {
            session.user = UserProfile(
                uid: "preview-\(UUID().uuidString)",
                email: email, name: name,
                bio: "Swift Academy Student",
                lessonsCompleted: 0,
                achievements: MockData.defaultAchievements
            )
            session.isAuthenticated = true
            isLoading = false
            return
        }

        Task {
            do {
                let profile = try await userService.signup(name: name, email: email, password: password)
                session.user = profile
                session.isAuthenticated = true
            } catch {
                // Map service errors to a simple string for the UI.
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }

    /// Fill demo credentials and attempt login. Useful for quick previews/demos.
    func demoLogin() {
        email = "demo@swift.academy"
        password = "password123"
        login()
    }
}
