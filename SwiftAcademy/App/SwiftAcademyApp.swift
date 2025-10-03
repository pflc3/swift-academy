// Main application entry point.
// Configures global app objects and wires dependency container into the SwiftUI environment.
// Controls initial routing between Splash, Auth, and main Content views.

import SwiftUI

/// Application entry point. Wires global services into the SwiftUI environment.
/// Keeps scene composition declarative and delegates business logic to `SessionManager`.
@main
struct SwiftAcademyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let deps: AppDependencies
    @StateObject private var session: SessionManager
    @StateObject private var toasts: ToastCenter

    init() {
        let deps = AppDependencies()
        // Use StateObject wrappers for lifecycle-managed services that SwiftUI owns.
        _session = StateObject(wrappedValue: deps.session)
        _toasts  = StateObject(wrappedValue: deps.toasts)
        self.deps = deps
    }

    var body: some Scene {
        WindowGroup {
            Group {
                if session.isBootstrapping {
                    SplashView()
                } else if session.isAuthenticated, session.user != nil {
                    ContentView()
                        .environmentObject(session)
                        .environmentObject(deps.userService)
                        .environmentObject(deps.chatService)
                        .environmentObject(toasts)
                } else {
                    AuthView()
                        .environmentObject(session)
                        .environmentObject(deps.userService)
                        .environmentObject(toasts)
                }
            }
            // Start session bootstrapping asynchronously when the scene appears.
            .task { session.start() }
        }
    }
}
