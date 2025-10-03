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

    /// Start observing auth state once. Safe to call from SwiftUI life cycle.
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
                        // Load the domain profile for the authenticated Firebase user.
                        self.user = try await self.userService.loadProfile(uid: fbUser.uid)
                        self.isAuthenticated = true
                    } catch {
                        // On failure, clear state and allow UI to show an unauthenticated flow.
                        self.user = nil
                        self.isAuthenticated = false
                    }
                } else {
                    self.user = nil
                    self.isAuthenticated = false
                }
                // Only clear the bootstrapping flag once after the first auth check.
                if !self.didResolveInitial {
                    self.isBootstrapping = false
                    self.didResolveInitial = true
                }
            }
        }
    }
}
