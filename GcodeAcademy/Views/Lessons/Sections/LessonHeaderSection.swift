import SwiftUI

struct LessonHeaderSection: View {
    let lesson: Lesson
    let progressPercentage: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Title
            Text(lesson.title)
                .font(.titleLarge)
                .foregroundColor(.textPrimaryApp)
            
            // Difficulty and duration info
            HStack(spacing: 16) {
                Label {
                    Text(lesson.difficulty)
                        .font(.caption)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "chart.bar")
                        .foregroundColor(.primaryApp)
                }
                
                Label {
                    Text("\(lesson.duration) minutes")
                        .font(.caption)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "clock")
                        .foregroundColor(.primaryApp)
                }
            }
            
            // Description
            Text(lesson.description)
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
                .padding(.top, 4)
            
            // Progress bar
            ProgressView(value: progressPercentage)
                .progressViewStyle(.linear)
                .tint(Color.accentApp)
                .padding(.top, 8)
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    LessonHeaderSection(
        lesson: MockData.binaryCommunicationLesson,
        progressPercentage: 0.35
    )
    .padding()
}
