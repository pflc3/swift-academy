// SwiftAcademy App - main application entry point.
// Configures global app objects and wires dependency container into the SwiftUI environment.
// Controls initial routing between Splash, Auth, and main Content views.
import SwiftUI

@main
struct SwiftAcademyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let deps: AppDependencies
    @StateObject private var session: SessionManager
    @StateObject private var toasts: ToastCenter

    init() {
        let deps = AppDependencies()
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
            .task { session.start() }
        }
    }
}
