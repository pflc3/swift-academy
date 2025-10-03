// Home header section.
// Displays overall progress and summary used at the top of the Home screen.
// Contains a simple progress view and percentage indicator.

import SwiftUI

struct HomeHeaderSection: View {
    let lessonsCompleted: Int
    let totalLessons: Int

    private var progressRatio: Double {
        guard totalLessons > 0 else { return 0 }
        return Double(lessonsCompleted) / Double(totalLessons)
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("\(lessonsCompleted)/\(totalLessons) completed")
                        .font(.bodyMedium)
                        .foregroundColor(.textSecondaryApp)

                    Spacer()

                    Text("\(Int(progressRatio * 100))%")
                        .font(.bodyMedium.bold())
                        .foregroundColor(.primaryApp)
                }

                ProgressView(value: progressRatio)
                    .tint(Color.primaryApp)
                    .padding(.bottom, 8)
            }
            .padding()
            .background(Color.cardBackgroundApp)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeHeaderSection(lessonsCompleted: 4, totalLessons: 12)
}
