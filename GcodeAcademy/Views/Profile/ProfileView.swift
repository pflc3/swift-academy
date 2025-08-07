import SwiftUI

struct ProfileView: View {
    // State variables to track user data and edit profile sheet visibility
    @EnvironmentObject var user: User
    @State private var showingEditProfile = false

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                Spacer()
                // Pass the binding to the header
                ProfileHeaderSection(
                    showingEditProfile: $showingEditProfile
                ).environmentObject(user)
                
                ProfileStatsSection().environmentObject(user)
                ProfileAchievementsSection().environmentObject(user)
                ProfileFooterSection()
            }
        }
        .ignoresSafeArea(.all)
        .background(Color.backgroundApp)
        .sheet(isPresented: $showingEditProfile) {
            EditProfileView() // ✅ No parameters
                .environmentObject(user) // 👈 Inject user here
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(User(name: "Preview User"))
}

