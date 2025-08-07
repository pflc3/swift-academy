import SwiftUI

// Displays a grid of the user's achievements
struct ProfileAchievementsSection: View {
    // The user model containing achievements
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Section title
            Text("Achievements")
                .font(.titleSmall)
                .foregroundColor(.textPrimaryApp)
            
            // Grid layout for achievement badges - two columns
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                // Display each achievement from user data using our card function
                ForEach(user.achievements) { achievement in
                    achievementCard(achievement)
                }
            }
        }
        .padding(16)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.03), radius: 3, x: 0, y: 1)
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
        VStack(spacing: 12) {
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
                if achievement.unlocked {
                    // Show only name if unlocked
                    Text(achievement.name)
                        .font(.bodyMedium)
                        .foregroundColor(.textPrimaryApp)
                        .multilineTextAlignment(.center)
                } else {
                    // Show "Locked" text for locked achievements
                    Text("Locked: \(achievement.name)")
                        .font(.caption)
                        .foregroundColor(.textSecondaryApp)
                        .lineLimit(1)
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(achievement.unlocked ? Color.cardBackgroundApp : Color.surfaceApp)
                .shadow(color: Color.black.opacity(achievement.unlocked ? 0.05 : 0), radius: 2, x: 0, y: 1)
        )
    }
}

#Preview {
    // Make sure we have achievements data in the user for the preview
    ProfileAchievementsSection().environmentObject(CurrentUser.user)
}
