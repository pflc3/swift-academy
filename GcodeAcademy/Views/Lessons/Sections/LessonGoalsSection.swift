import SwiftUI

struct LessonGoalsSection: View {
    let goals: [Lesson.LessonGoal]
    @Binding var completedGoals: Set<UUID>
    
    var body: some View {
        Text("Lesson Goals Section")
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    LessonGoalsSection(
        goals: MockData.binaryCommunicationLesson.goals,
        completedGoals: .constant([])
    )
}
