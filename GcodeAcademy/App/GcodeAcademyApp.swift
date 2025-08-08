import SwiftUI

@main
struct GcodeAcademyApp: App {
    // Create our user manager as a StateObject at the app level
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            if userManager.isAuthenticated {
                // User is authenticated
                ContentView()
                    .environmentObject(userManager)
                    .environmentObject(userManager.currentUser!)
            } else {
                // User needs to authenticate
                AuthView()
                    .environmentObject(userManager)
            }
        }
    }
}
