import SwiftUI

struct ProfileView: View {
    // State variables to track user data and edit profile sheet visibility
    @State private var user = MockData.currentUser
    @State private var showingEditProfile = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Pass the binding to the header
                ProfileHeaderSection(
                    user: user,
                    showingEditProfile: $showingEditProfile
                )
                
                ProfileStatsSection(user: user)
                ProfileAchievementsSection(user: user)
                ProfileFooterSection()
            }
            .background(Color.backgroundApp)
        }
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $showingEditProfile) {
            EditProfileView(user: $user)
        }
    }
}

#Preview {
    ProfileView()
}
