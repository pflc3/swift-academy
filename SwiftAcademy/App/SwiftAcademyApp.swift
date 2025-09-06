import SwiftUI
import FirebaseCore

// AppDelegate handles Firebase setup
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SwiftAcademyApp: App {
    // Register AppDelegate so Firebase initializes properly
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    // Observable object: Keeps it alive for the lifetime creator
    @StateObject private var userManager = UserManager()

    var body: some Scene {
        WindowGroup {
            if userManager.isBootstrapping {
                SplashView()
            } else if userManager.isAuthenticated, let user = userManager.currentUser {
                // User is authenticated
                ContentView()
                    .environmentObject(userManager)
                    .environmentObject(user)
            } else {
                // User needs to authenticate
                AuthView()
                    .environmentObject(userManager)
            }
        }
    }
}
