import SwiftUI

struct ProfileView: View {
    // State variables to track user data and edit profile sheet visibility
    @State private var user = MockData.currentUser
    @State private var showingEditProfile = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16){
                    // Use the modular components instead of inline implementations
                    ProfileHeaderSection(user: user)
                    ProfileStatsSection(user: user)
                    ProfileAchievementsSection(user: user)
                    ProfileInfoSection()
                    
                }
                .background(Color.backgroundApp)
                .padding(.bottom, 20)
            }
            .toolbar {
                // Edit button in the navigation bar
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showingEditProfile = true}) {
                        Image(systemName: "pencil")
                            .font(.system(size:10))
                            .foregroundColor(Color.primaryApp)
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill(Color.surfaceApp)
                            )
                    }
                }
            }
            .sheet(isPresented: $showingEditProfile) {
                EditProfileView(user: $user)
            }
        }
    }
}

#Preview {
    ProfileView()
}
