import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var toasts: ToastCenter
    
    @State private var selectedTab = 1
    @State private var showMenu = false
    @State private var isShowingLessonDetail = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(spacing: 0) {
                if !isShowingLessonDetail {
                    CustomNavBar(
                        title: title,
                        showMenu: $showMenu
                    )
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                ZStack {
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
                        NavigationView { ChatBotView() }
                            .transition(.opacity)
                    }
                    
                    if selectedTab == 3 {
                        NavigationView { ProfileView() }
                            .transition(.opacity)
                    }
                }
                .animation(.easeInOut(duration: 0.2), value: selectedTab)
            }
            .background(Color.backgroundApp)
            .edgesIgnoringSafeArea(.bottom)

            if showMenu && !isShowingLessonDetail {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture { hideMenu() }
            }
            
            if !isShowingLessonDetail {
                SideMenu(
                    selectedTab: $selectedTab,
                    showMenu: $showMenu,
                    hideMenuAction: hideMenu
                )
                .offset(x: showMenu ? 0 : -280)
                .animation(.spring(response: 0.3, dampingFraction: 0.8), value: showMenu)
            }
        }
        .animation(.easeOut(duration: 0.2), value: isShowingLessonDetail)
        .ignoresSafeArea(.all, edges: .bottom)
        .overlay(alignment: .bottom) {
            if let toast = toasts.current {
                ToastBanner(toast: toast)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom).combined(with: .opacity),
                        removal: .move(edge: .bottom).combined(with: .opacity)
                    ))
            }
        }
    }
    
    private func hideMenu() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            showMenu = false
        }
    }
    
    private var title: String {
        switch selectedTab {
        case 1: return "Swift Journey"
        case 2: return "Code Coach"
        case 3: return ""
        default: return "Swift Academy"
        }
    }
}

#Preview {
    let deps = PreviewDeps(user: MockData.users.first)
    return ContentView().previewEnv(deps)
}
