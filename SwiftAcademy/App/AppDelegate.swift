// AppDelegate.
// Provides application lifecycle hooks used for app startup and Firebase setup.
// Belongs to the App module; performs high-level app initialization tasks.

import FirebaseCore
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
