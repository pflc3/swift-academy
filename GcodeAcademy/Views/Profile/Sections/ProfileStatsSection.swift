import SwiftUI

struct ProfileStatsSection: View {
    // the user model containing progress information
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack(spacing: 0) {
            //Title
            Text("Progress")
                .font(.titleSmall)
                .foregroundColor(.textPrimaryApp)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)
            
            //Stats cards for lessons completed and progress percentage
            HStack(spacing: 16) {
                // Lasson completed card
                statCard(
                    value: "\(user.lessonsCompleted)",
                    label: "Lessons",
                    icon: "book.fill",
                    color: .primaryApp
                )
                
                // Progress percentage card
                statCard(
                    value: "\(Int(user.progressPercentage * 100))%",
                    label: "Complete",
                    icon: "chart.bar.fill",
                    color: .accentApp
                )
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            
            // Progress bar implementation
            progressBar
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
        }
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity (0.03), radius: 3, x: 0, y: 1)
        .padding(.horizontal, 16)
    }
    
    /*
     * Helper function to create consistent stat cards
     *
     * This function takes parameters to customize each card:
     * - value: the numerical value to display ('2" or "28%")
     * - label: The description of the value ("Lessons" of Complete")
     * - icon: SF Symbol name to use as the icon
     * - color: The theme color to use for the icon and background
     */
    private func statCard(value: String, label: String, icon: String, color: Color) -> some View {
        HStack {
            // Left Icon
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(color)
                .frame(width: 32, height: 32)
            
            // Value and Label
            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.titleMedium)
                    .foregroundColor(.textPrimaryApp)
                
                Text(label)
                    .font(.caption)
                    .foregroundColor(.textSecondaryApp)
            }
            
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
    
    /*
     * Progress bar with gradient fill and lesson information
     * This uses Geometry Reader to create a responsive width based on the user's progress
     */
    var progressBar: some View {
        VStack(spacing: 8) {
            // Visual progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background track
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.surfaceApp)
                        .frame(height: 8)
                    
                    // Filled portion based on progress percentage
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [.primaryApp, .accentApp],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: max(8, geometry.size.width * user.progressPercentage), height: 8)
                }
            }
            .frame(height: 8)
            
            // Progress labels – completed lessons counter
            Text("\(user.lessonsCompleted) of \(user.totalLessons)")
                .font(.caption)
                .foregroundColor(.textSecondaryApp)
        }
    }
}

#Preview {
    ProfileStatsSection().environmentObject(CurrentUser.user)
}
