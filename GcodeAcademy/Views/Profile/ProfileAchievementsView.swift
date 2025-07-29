import SwiftUI

// Displays a grid of the user's achievements
struct ProfileAchievementsView: View {
    // The user model containing achievements
    let user: User
    
    var body: some View {
        // Placeholder implementation
        Text("Here goes the achievements section")
    }
}

#Preview {
    ProfileAchievementsView(user: MockData.currentUser)
}
