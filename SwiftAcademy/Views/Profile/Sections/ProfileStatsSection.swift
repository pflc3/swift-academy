import SwiftUI

struct ProfileStatsSection: View {
    let user: UserProfile
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Progress")
                .font(.titleSmall)
                .foregroundColor(.textPrimaryApp)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)
            
            HStack(spacing: 16) {
                statCard(
                    value: "\(user.lessonsCompleted)",
                    label: "Lessons",
                    icon: "book.fill",
                    color: .primaryApp
                )
                
                statCard(
                    value: "\(Int(user.progressPercentage * 100))%",
                    label: "Complete",
                    icon: "chart.bar.fill",
                    color: .accentApp
                )
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            
            progressBar
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
        }
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.03), radius: 3, x: 0, y: 1)
        .padding(.horizontal, 16)
    }
    
    private func statCard(value: String, label: String, icon: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(color)
                .frame(width: 32, height: 32)
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
    
    var progressBar: some View {
        VStack(spacing: 8) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.surfaceApp)
                        .frame(height: 8)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(LinearGradient(colors: [.primaryApp, .accentApp], startPoint: .leading, endPoint: .trailing))
                        .frame(width: max(8, geometry.size.width * user.progressPercentage), height: 8)
                }
            }
            .frame(height: 8)
            Text("\(user.lessonsCompleted) of \(user.totalLessons)")
                .font(.caption)
                .foregroundColor(.textSecondaryApp)
        }
    }
}

#Preview {
    ProfileStatsSection(user: MockData.users[0])
}
