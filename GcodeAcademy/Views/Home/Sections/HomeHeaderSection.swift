import SwiftUI

struct HomeHeaderSection: View {
    @EnvironmentObject var user: User
    var lessons: [Lesson]
    
    var body: some View {
        VStack {
            // Simple welcome section (not a full header since we have one in ContentView)
            VStack(alignment: .leading, spacing: 8) {
                
                // Simple progress indicator
                HStack {
                    Text("\(user.lessonsCompleted)/\(lessons.count) completed")
                        .font(.bodyMedium)
                        .foregroundColor(.textSecondaryApp)
                    
                    Spacer()
                    
                    Text("\(Int((Float(user.lessonsCompleted) / Float(lessons.count)) * 100))%")
                        .font(.bodyMedium.bold())
                        .foregroundColor(.primaryApp)
                }
                
                // Corrected Progress bar
                ProgressView(value: Float(user.lessonsCompleted) / Float(lessons.count))
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
    HomeHeaderSection(lessons: LessonData.allLessons).environmentObject(CurrentUser.user)
}
