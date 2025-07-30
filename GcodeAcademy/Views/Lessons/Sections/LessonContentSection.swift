import SwiftUI

struct LessonContentSection: View {
    let contentSections: [Lesson.ContentSection]
    
    var body: some View {
        Text("Lesson Content Section")
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    LessonContentSection(
        contentSections: MockData.binaryCommunicationLesson.contentSections
    )
}
