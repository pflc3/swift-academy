import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            ChatBotView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }.tag(1)
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(0)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }.tag(2)
        }
    }
}

#Preview {
    ContentView()
}
