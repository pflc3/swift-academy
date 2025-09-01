import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab: Int
    @Binding var showMenu: Bool
    var hideMenuAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // App Logo and Title
            HStack(alignment: .center, spacing: 16) {
                // Beaver image
                Image("BeaverDark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                // Stacked text
                VStack(alignment: .leading, spacing: 0) {
                    Text("Swift")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.primaryApp)
                    
                    Text("Academy")
                        .font(.system(size: 28, weight: .semibold))
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
                    title: "Swift Journey",
                    icon: "map",
                    selectedIcon: nil,
                    isSelected: selectedTab == 1,
                    action: { selectTab(1) },
                    isCustomIcon: false
                )
                
                MenuItem(
                    title: "Code Coach",
                    icon: "code-coach-normal",
                    selectedIcon: "code-coach-selected",
                    isSelected: selectedTab == 2,
                    action: { selectTab(2) },
                    isCustomIcon: true
                )
                
                MenuItem(
                    title: "My Profile",
                    icon: "person",
                    selectedIcon: nil,
                    isSelected: selectedTab == 3,
                    action: { selectTab(3) },
                    isCustomIcon: false
                )
            }
            .padding(.horizontal, 12)
            
            Spacer()
            
            // Footer
            HStack {
                Spacer()
                Text("© 2025 Prime Factors Learning Lab")
                    .font(.caption)
                    .foregroundColor(.textTertiaryApp)
                Spacer()
            }
            .padding(.bottom, 32)
        }
        .frame(width: 280)
        .background(Color.cardBackgroundApp)
        .edgesIgnoringSafeArea(.vertical)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
    }
    
    private func selectTab(_ tab: Int) {
        selectedTab = tab
        hideMenuAction()
    }
}

#Preview("Swift Journey") {
    SideMenu(selectedTab: .constant(1), showMenu: .constant(true), hideMenuAction: {})
}

#Preview("Code Coach") {
    SideMenu(selectedTab: .constant(2), showMenu: .constant(true), hideMenuAction: {})
}
