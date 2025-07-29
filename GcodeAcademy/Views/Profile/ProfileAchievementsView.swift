import SwiftUI

// Displays a grid of the user's achievements
struct ProfileAchievementsView: View {
    // The user model containing achievements
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Section title
            Text("Achievements")
                .font(.titleSmall)
                .foregroundColor(.textPrimaryApp)
            
            // Grid layout for achievement badges - two columns
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12){
                // Placeholder for achievement cards
                // We'll implement actual achievement cards in the next issue
                ForEach(user.achievements) { achievement in
                    Text(achievement.name)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.surfaceApp)
                        .cornerRadius(12)
                }
            }
        }
        .padding(16)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.03), radius:3, x:0, y:1)
        .padding(.horizontal, 16)
    }
}

#Preview {
    // Make sure we have achievements data in the user for the preview
    ProfileAchievementsView(user: MockData.currentUser)
}
