import SwiftUI
@main
struct GCodeAcademyApp: App {
    @StateObject var user = User(name: "Joshua Mark")

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user) // ✅ Now this works
        }
    }
}
