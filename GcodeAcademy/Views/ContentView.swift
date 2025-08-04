import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1  // Default to Home
    @State private var showMenu = false
    
    var body: some View {
        ZStack {
            // Main content based on selection
            VStack {
                // Top navigation bar
                HStack {
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .foregroundColor(.primaryApp)
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Title based on selected tab
                    Text(title)
                        .font(.titleMedium)
                        .foregroundColor(.textPrimaryApp)
                    
                    Spacer()
                    
                    // Empty space to balance the hamburger button
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.clear)
                        .padding()
                }
                .background(Color.cardBackgroundApp)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                
                // Content
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(1)
                    
                    ChatBotView()
                        .tag(2)
                    
                    ProfileView()
                        .tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .disabled(showMenu)
            }
            
            // Side menu
            if showMenu {
                // Semi-transparent overlay to dismiss menu when tapped
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                    }
                
                // Menu drawer
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer().frame(height:40)
                        // App title/logo
                        Text("Gcode Academy")
                            .font(.titleLarge)
                            .foregroundColor(.primaryApp)
                            .padding(.vertical, 20)
                            .padding(.horizontal)
                        
                        Divider()
                        
                        // Menu items
                        menuItem(title: "Home", icon: "house", tab: 1)
                        menuItem(title: "Chat", icon: "message", tab: 2)
                        
                        Spacer()
                        
                        // Optional: Settings or other bottom items
                        Divider()
                        menuItem(title: "Profile", icon: "person", tab: 3)
                            .padding(.bottom)
                    }
                    .frame(width: 270)
                    .background(Color.cardBackgroundApp)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
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
    
    // Menu item component
    @ViewBuilder
    func menuItem(title: String, icon: String, tab: Int) -> some View {
        Button(action: {
            withAnimation {
                selectedTab = tab
                showMenu = false
            }
        }) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(selectedTab == tab ? .primaryApp : .textSecondaryApp)
                
                Text(title)
                    .font(.bodyLarge)
                    .foregroundColor(selectedTab == tab ? .primaryApp : .textPrimaryApp)
                
                Spacer()
                
                // Selection indicator
                if selectedTab == tab {
                    Rectangle()
                        .fill(Color.primaryApp)
                        .frame(width: 5, height: 40)
                }
            }
            .padding(.horizontal)
            .background(selectedTab == tab ? Color.primaryApp.opacity(0.1) : Color.clear)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(height: 50)
    }
}

#Preview {
    ContentView()
}
