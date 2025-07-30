import SwiftUI

struct LessonQuestionsSection: View {
    let questions: [Lesson.Question]
    @Binding var selectedQuestionIndex: Int?
    
    var body: some View {
        Text("Lesson Questions Section")
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    LessonQuestionsSection(
        questions: MockData.binaryCommunicationLesson.questions,
        selectedQuestionIndex: .constant(nil)
    )
}
