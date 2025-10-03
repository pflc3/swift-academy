// SessionManager.
// Manages authentication state, loads user profile, and publishes session events.
// Observes Firebase auth state and reconciles local `UserProfile` for the app environment.

import FirebaseAuth
import Foundation

@MainActor
final class SessionManager: ObservableObject {
    @Published var user: UserProfile?
    @Published var isAuthenticated = false
    @Published var isBootstrapping = true

    private let userService: UserService
    private var authHandle: AuthStateDidChangeListenerHandle?
    private var didResolveInitial = false
    private var hasStarted = false

    init(userService: UserService) {
        self.userService = userService
    }

    func start() {
        guard !hasStarted else { return }
        hasStarted = true
        observeAuth()
    }

    deinit {
        if let handle = authHandle { Auth.auth().removeStateDidChangeListener(handle) }
    }

    private func observeAuth() {
        authHandle = Auth.auth().addStateDidChangeListener { [weak self] _, firebaseUser in
            guard let self else { return }
            Task { @MainActor in
                if let fbUser = firebaseUser {
                    do {
                        self.user = try await self.userService.loadProfile(uid: fbUser.uid)
                        self.isAuthenticated = true
                    } catch {
                        self.user = nil
                        self.isAuthenticated = false
                    }
                } else {
                    self.user = nil
                    self.isAuthenticated = false
                }
                if !self.didResolveInitial {
                    self.isBootstrapping = false
                    self.didResolveInitial = true
                }
            }
        }
    }
}
