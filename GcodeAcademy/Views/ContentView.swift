import SwiftUI

struct ContentView: View {
    // State for tracking selected tab and menu visibility
    @State private var selectedTab = 1  // Default to Home
    @State private var showMenu = false
    
    // Gesture state for custom swipe-to-open menu
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .leading) {
            // MARK: - Main Content Container
            VStack(spacing: 0) {
                // Custom Navigation Bar
                CustomNavigationBar(
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
            
            // MARK: - Side Menu & Overlay
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

// MARK: - Custom Navigation Bar Component
struct CustomNavigationBar: View {
    let title: String
    @Binding var showMenu: Bool
    
    var body: some View {
        HStack {
            // Menu Button
            Button(action: {
                withAnimation(.spring()) {
                    showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.titleMedium)
                    .foregroundColor(.primaryApp)
                    .padding(.leading, 16)
            }
            
            Spacer()
            
            // Title
            Text(title)
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)
            
            Spacer()
            
            // Empty space to balance the hamburger button
            Image(systemName: "line.horizontal.3")
                .font(.titleMedium)
                .foregroundColor(.clear)
                .padding(.trailing, 16)
        }
        .frame(height: 60)
        .background(Color.cardBackgroundApp)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}

// MARK: - Side Menu Component
struct SideMenu: View {
    @Binding var selectedTab: Int
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // App Logo and Title - aligned as in the screenshot
            HStack(alignment: .center, spacing: 16) {
                // Beaver image
                Image("Beaver")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                // Vertically centered text
                VStack(alignment: .leading, spacing: 0) {
                    Text("Gcode")
                        .font(.titleExtraM)
                        .foregroundColor(.primaryApp)
                    
                    Text("Academy")
                        .font(.titleExtraM)
                        .foregroundColor(.primaryApp)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 60)
            .padding(.bottom, 30)
            
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            // Navigation Menu Items
            VStack(spacing: 8) {
                MenuItem(
                    title: "Learning Path",
                    icon: "house",
                    isSelected: selectedTab == 1,
                    action: { selectTab(1) }
                )
                
                MenuItem(
                    title: "Chat Assistant",
                    icon: "message",
                    isSelected: selectedTab == 2,
                    action: { selectTab(2) }
                )
                
                MenuItem(
                    title: "My Profile",
                    icon: "person",
                    isSelected: selectedTab == 3,
                    action: { selectTab(3) }
                )
            }
            .padding(.horizontal, 12)
            
            Spacer()
            
            // Improved footer
            HStack {
                Spacer()
                Text("© 2025 Prime Factors Learning Lab")
                    .font(.caption2)
                    .foregroundColor(.textTertiaryApp)
                Spacer()
            }
            .padding(.bottom, 20)
        }
        .frame(width: 280)
        .background(Color.cardBackgroundApp)
        .edgesIgnoringSafeArea(.vertical)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
    }
    
    private func selectTab(_ tab: Int) {
        selectedTab = tab
        withAnimation(.spring()) {
            showMenu = false
        }
    }
}

// MARK: - Menu Item Component
struct MenuItem: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Icon
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .primaryApp : .textSecondaryApp)
                    .frame(width: 24)
                
                // Title
                Text(title)
                    .font(.bodyLarge)
                    .foregroundColor(isSelected ? .primaryApp : .textPrimaryApp)
                
                Spacer()
                
                // Simple selection indicator
                if isSelected {
                    Rectangle()
                        .fill(Color.primaryApp)
                        .frame(width: 3, height: 24)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(isSelected ? Color.primaryApp.opacity(0.05) : Color.clear)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ContentView()
}
