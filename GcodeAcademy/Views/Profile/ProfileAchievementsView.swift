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
    
    /*
     * Helper function to create achievement cards with different styling based on unlock status
     *
     * This function:
     * - Shows an icon from SF Symbols
     * - Changes colors based on whether the achievement is unlocked
     * - Shows a "Locked" label for locked achievements
     * - Adds subtle shadows and background changes
     */
    private func achievementCard(_ achievement: Achievement) -> some View {
        VStack(spacing:12) {
            // Achievement icon
            Image(systemName: achievement.icon)
                .font(.system(size: 24))
                .foregroundColor(achievement.unlocked ? .accentApp : .textTertiaryApp)
                .frame(width: 48, height: 48)
                .background(
                    Circle()
                        .fill(achievement.unlocked ? Color.accentApp.opacity(0.1) : Color.surfaceApp)
                )
            
            // Achievement name and status
            VStack(spacing: 2) {
                Text(achievement.name)
                    .font(.bodyMedium)
                    .foregroundColor(achievement.unlocked ? Color.accentApp.opacity(0.1) : Color.surfaceApp)
                multilineTextAlignment(.center)
                
                //Only show "Locked" text for locked achievements
                if !achievement.unlocked {
                    Text("Locked")
                        .font(.caption)
                        .foregroundColor(.textTertiaryApp)
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(achievement.unlocked ? Color.cardBackgroundApp : Color.surfaceApp)
                .foregroundColor(.textTertiaryApp)
            
        )
    }
}
    #Preview {
        // Make sure we have achievements data in the user for the preview
        ProfileAchievementsView(user: MockData.currentUser)
    }
