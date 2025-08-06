import SwiftUI

@main
struct GcodeAcademyApp: App {
    // State to track if user is authenticated
    @State private var isAuthenticated = false
    
    // For development, you can set this to true to skip the auth screens
    @State private var skipAuth = false
    
    var body: some Scene {
        WindowGroup {
            if isAuthenticated || skipAuth {
                ContentView()
            } else {
                AuthView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}
