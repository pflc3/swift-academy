import SwiftUI

struct ProfileAchievementsSection: View {
    let user: UserProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Achievements")
                .font(.titleSmall)
                .foregroundColor(.textPrimaryApp)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
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
    
    private func achievementCard(_ achievement: Achievement) -> some View {
        VStack(spacing: 12) {
            Image(systemName: achievement.icon)
                .font(.system(size: 24))
                .foregroundColor(achievement.unlocked ? .accentApp : .textTertiaryApp)
                .frame(width: 48, height: 48)
                .background(
                    Circle().fill(achievement.unlocked ? Color.accentApp.opacity(0.1) : Color.surfaceApp)
                )
            VStack(spacing: 2) {
                if achievement.unlocked {
                    Text(achievement.name)
                        .font(.bodyMedium)
                        .foregroundColor(.textPrimaryApp)
                        .multilineTextAlignment(.center)
                } else {
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
    ProfileAchievementsSection(user: MockData.users[0])
}
