import SwiftUI

struct ContentView: View {
    // State for tracking selected tab and menu visibility
    @State private var selectedTab = 1  // Default to Home
    @State private var showMenu = false
    
    // Gesture state for custom swipe-to-open menu
    @State private var dragOffset: CGFloat = 0
    
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
                .tabViewStyle(.page(indexDisplayMode: .never))
                .disabled(showMenu)
                .animation(.easeInOut, value: selectedTab) // Smooth transitions between tabs
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
            
            // Add a gesture to detect swipes from the left edge to open the menu
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if !showMenu && gesture.startLocation.x < 50 && gesture.translation.width > 0 {
                            dragOffset = min(gesture.translation.width, 280)
                        } else if showMenu {
                            dragOffset = min(max(gesture.translation.width, -280), 0)
                        }
                    }
                    .onEnded { gesture in
                        if !showMenu && dragOffset > 100 {
                            showMenu = true
                        } else if showMenu && dragOffset < -100 {
                            showMenu = false
                        }
                        dragOffset = 0
                    }
            )
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
