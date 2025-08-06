import SwiftUI

struct ProfileView: View {
    // State variables to track user data and edit profile sheet visibility
    @State private var user = MockData.currentUser
    @State private var showingEditProfile = false

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                // Pass the binding to the header
                ProfileHeaderSection(
                    user: user,
                    showingEditProfile: $showingEditProfile
                )
                
                ProfileStatsSection(user: user)
                ProfileAchievementsSection(user: user)
                ProfileFooterSection()
                
                Spacer(minLength: 22)
            }
        }
        .ignoresSafeArea(.all)
        .background(Color.backgroundApp)
        .sheet(isPresented: $showingEditProfile) {
            EditProfileView(user: $user)
        }
    }
}

#Preview {
    ProfileView()
}
