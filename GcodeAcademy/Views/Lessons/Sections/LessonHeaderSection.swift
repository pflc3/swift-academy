// LessonHeaderSection.swift
import SwiftUI

struct LessonHeaderSection: View {
    let lesson: Lesson
    let isCompleted: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Description
            Text(lesson.description)
                .font(.bodyLarge)
                .foregroundColor(.textSecondaryApp)
                .padding(.top, 4)
            
            // Metadata row with completion status
            HStack(spacing: 20) {
                // Difficulty
                Label {
                    Text(lesson.difficulty.rawValue)
                        .font(.caption)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "chart.bar")
                        .foregroundColor(.primaryApp)
                }
                
                // Duration
                Label {
                    Text("\(lesson.duration) minutes")
                        .font(.caption)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "clock")
                        .foregroundColor(.primaryApp)
                }
                
                Spacer()
                
                // Completion status
                HStack(spacing: 4) {
                    Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(isCompleted ? .accentApp : .textTertiaryApp)
                    
                    Text(isCompleted ? "Completed" : "In Progress")
                        .font(.caption)
                        .foregroundColor(isCompleted ? .accentApp : .textTertiaryApp)
                }
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    VStack {
        LessonHeaderSection(
            lesson: LessonData.binaryLesson,
            isCompleted: true
        )
        
        LessonHeaderSection(
            lesson: LessonData.dataTypesLesson,
            isCompleted: false
        )
    }
    .padding()
}
