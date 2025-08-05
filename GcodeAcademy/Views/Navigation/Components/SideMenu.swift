import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab: Int
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // App Logo and Title
            HStack(alignment: .center, spacing: 16) {
                // Beaver image
                Image("Beaver")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                // Stacked text
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
                    title: "AI Tutor",
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
            
            // Footer
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

#Preview {
    SideMenu(selectedTab: .constant(1), showMenu: .constant(true))
}
