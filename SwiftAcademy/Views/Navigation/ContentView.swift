import SwiftUI

struct ContentView: View {
    // Environment objects
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var user: User
    
    // State for tracking selected tab and menu visibility
    @State private var selectedTab = 1  // Default to Home
    @State private var showMenu = false
    @State private var isShowingLessonDetail = false  // Track lesson detail view
    
    var body: some View {
        ZStack(alignment: .leading) {
            /*
             * Main Content Container
             */
            VStack(spacing: 0) {
                // Custom Navigation Bar - only show when not in lesson detail
                if !isShowingLessonDetail {
                    CustomNavBar(
                        title: title,
                        showMenu: $showMenu
                    )
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                // Custom tab content
                ZStack {
                    // Only show the selected view
                    if selectedTab == 1 {
                        NavigationView {
                            HomeView(onShowingLessonDetail: { isShowing in
                                withAnimation(.easeOut(duration: 0.2)) {
                                    isShowingLessonDetail = isShowing
                                }
                            })
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
                .animation(.easeInOut(duration: 0.2), value: selectedTab) // Shorter animation
            }
            .background(Color.backgroundApp)
            .edgesIgnoringSafeArea(.bottom)

            /*
             * Menu Overlay
             */

            // Dark overlay when menu is open
            if showMenu && !isShowingLessonDetail {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture {
                        hideMenu()
                    }
            }
            
            // Side Menu - only enable when not in lesson detail
            if !isShowingLessonDetail {
                SideMenu(
                    selectedTab: $selectedTab,
                    showMenu: $showMenu,
                    hideMenuAction: hideMenu // Pass the same hide function
                )
                .offset(x: showMenu ? 0 : -280)
                .animation(.spring(response: 0.3, dampingFraction: 0.8), value: showMenu)
            }
        }
        .animation(.easeOut(duration: 0.2), value: isShowingLessonDetail) // Animate navbar changes
        .ignoresSafeArea(.all, edges: .bottom)
        // Toast overlay (global, bottom of screen)
        .overlay(
            Group {
                if let toast = userManager.currentToast {
                    VStack {
                        Spacer()
                        HStack {
                            if toast.isPositive {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            } else {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.orange)
                                    .font(.title3)
                            }
                            
                            Text(toast.message)
                                .font(.body)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color(.systemBackground))
                                .shadow(
                                    color: .black.opacity(0.15),
                                    radius: 8,
                                    x: 0,
                                    y: 4
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(
                                    toast.isPositive ? Color.green.opacity(0.3) : Color.orange.opacity(0.3),
                                    lineWidth: 1
                                )
                        )
                        .padding(.horizontal, 16)
                        .padding(.bottom, 50)
                    }
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom).combined(with: .opacity),
                        removal: .move(edge: .bottom).combined(with: .opacity)
                    ))
                    .animation(.spring(response: 0.6, dampingFraction: 0.8), value: toast.message)
                }
            }
            .allowsHitTesting(false)
        )
    }
    
    // Centralized function to hide menu
    private func hideMenu() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            showMenu = false
        }
    }
    
    // Dynamic title based on selected tab
    var title: String {
        switch selectedTab {
        case 1:
            return "Swift Journey"
        case 2:
            return "Code Coach"
        case 3:
            return ""
        default:
            return "Swift Academy"
        }
    }
}

#Preview {
    let userManager = UserManager()
    userManager.currentUser = MockData.users[0]
    return ContentView()
        .environmentObject(userManager)
        .environmentObject(MockData.users[0])
}
