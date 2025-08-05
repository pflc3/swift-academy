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
                
                // Custom tab content
                ZStack {
                    // Only show the selected view
                    if selectedTab == 1 {
                        NavigationView {
                            HomeView()
                        }
                        .transition(.opacity)
                    }
                    
                    if selectedTab == 2 {
                        NavigationView {
                            ChatBotView()
                        }
                        .transition(.opacity)
                    }
                    
                    if selectedTab == 3 {
                        NavigationView {
                            ProfileView()
                        }
                        .transition(.opacity)
                    }
                }
                .animation(.easeInOut, value: selectedTab)
            }
            .background(Color.backgroundApp)
            .edgesIgnoringSafeArea(.bottom)

            /*
             * Menu Overlay
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
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    // Dynamic title based on selected tab
    var title: String {
        switch selectedTab {
        case 1:
            return "Learning Path"
        case 2:
            return "AI Tutor"
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
