import SwiftUI

struct ProfileView: View {
    // Get user from environment object
    @EnvironmentObject var user: User
    @State private var showingEditProfile = false

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                // Pass the binding to the header
                ProfileHeaderSection(
                    showingEditProfile: $showingEditProfile
                )
                
                ProfileStatsSection()
                ProfileAchievementsSection()
                ProfileFooterSection()
                
                Spacer(minLength: 22)
            }
        }
        .ignoresSafeArea(.all)
        .background(Color.backgroundApp)
        .sheet(isPresented: $showingEditProfile) {
            EditProfileView()
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(MockData.users[0])
}
