import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ChatBotView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
