// AppDelegate.
// Provides application lifecycle hooks used for app startup and Firebase setup.
// Belongs to the App module; performs high-level app initialization tasks.

import FirebaseCore
import UIKit

/// Application delegate used to configure third-party services at app launch.
/// Keep initialization minimal; heavy setup belongs in dedicated services.
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // Configure Firebase early so analytics, auth, and RTDB are available app-wide.
        FirebaseApp.configure()
        return true
    }
}
