import Foundation

enum AuthScreen { case welcome, signin, create }

@MainActor
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
    
    func configure(session: SessionManager, userService: UserService, toasts: ToastCenter) {
        guard !isConfigured else { return }
        self.session = session
        self.userService = userService
        self.toasts = toasts
        isConfigured = true
    }
    
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
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
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
            session.user = UserProfile(uid: "preview-\(UUID().uuidString)", email: email, name: name, bio: "Swift Academy Student", lessonsCompleted: 0, achievements: MockData.defaultAchievements)
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
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
    func demoLogin() {
        email = "demo@swift.academy"
        password = "password123"
        login()
    }
}
