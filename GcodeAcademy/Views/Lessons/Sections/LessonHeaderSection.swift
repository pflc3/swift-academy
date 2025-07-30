import SwiftUI

struct LessonHeaderSection: View {
    let lesson: Lesson
    let progressPercentage: Double
    
    var body: some View {
        Text("Lesson Header Section")
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    LessonHeaderSection(
        lesson: MockData.binaryCommunicationLesson,
        progressPercentage: 0.4
    )
}
