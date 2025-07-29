import SwiftUI

// Displays the user's avatar, name, bio, and cohort information
struct ProfileHeaderView: View {
    // The user model to display
    let user: User
    
    var body: some View {
        // Placeholder implementation
        Text("Here goes the profile header")
    }
}

#Preview {
    ProfileHeaderView(user: MockData.currentUser)
}
