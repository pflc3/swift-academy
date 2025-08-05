import SwiftUI

struct ContentView: View {
    // State for tracking selected tab and menu visibility
    @State private var selectedTab = 1  // Default to Home
    @State private var showMenu = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            /*
             * Main Content Container
             */
            
            VStack(spacing: 0) {
                // Custom Navigation Bar
                CustomNavBar(
                    title: title,
                    showMenu: $showMenu
                )
                
                // Main Content Area
                TabView(selection: $selectedTab) {
                    // Home Tab
                    NavigationView {
                        HomeView()
                    }
                    .tag(1)
                    
                    // Chat Tab
                    NavigationView {
                        ChatBotView()
                    }
                    .tag(2)
                    
                    // Profile Tab
                    NavigationView {
                        ProfileView()
                    }
                    .tag(3)
                }
                .animation(.easeInOut, value: selectedTab) // Keep animation for tab changes
            }
            .background(Color.backgroundApp)

            /*
             * Main Content Container
             */

            // Dark overlay when menu is open
            if showMenu {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .animation(.easeInOut, value: showMenu)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showMenu = false
                        }
                    }
            }
            
            // Side Menu
            SideMenu(
                selectedTab: $selectedTab,
                showMenu: $showMenu
            )
            .offset(x: showMenu ? 0 : -280)
            .animation(.spring(response: 0.3, dampingFraction: 0.8), value: showMenu)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    // Dynamic title based on selected tab
    var title: String {
        switch selectedTab {
        case 1:
            return "Learning Path"
        case 2:
            return "Gcode Helper"
        case 3:
            return "My Profile"
        default:
            return "Gcode Academy"
        }
    }
}

#Preview {
    ContentView()
}
