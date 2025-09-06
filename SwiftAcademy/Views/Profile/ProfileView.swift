import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var userService: UserService
    @EnvironmentObject var toasts: ToastCenter
    
    @State private var showingEditProfile = false
    
    var body: some View {
        let user = session.user
        ScrollView {
            VStack(spacing: 22) {
                if let user {
                    ProfileHeaderSection(user: user, showingEditProfile: $showingEditProfile)
                    ProfileStatsSection(user: user)
                    ProfileAchievementsSection(user: user)
                    ProfileFooterSection()
                }
                Spacer(minLength: 22)
            }
        }
        .ignoresSafeArea(.all)
        .background(Color.backgroundApp)
        .sheet(isPresented: $showingEditProfile) {
            EditProfileView(
                vm: ProfileViewModel(
                    session: session,
                    userService: userService,
                    toasts: toasts
                )
            )
        }
    }
}

#Preview {
    let deps = AppDependencies()
    deps.session.isBootstrapping = false
    deps.session.isAuthenticated = true
    deps.session.user = MockData.users[0]
    return ProfileView()
        .environmentObject(deps.session)
        .environmentObject(deps.userService)
        .environmentObject(deps.toasts)
}
