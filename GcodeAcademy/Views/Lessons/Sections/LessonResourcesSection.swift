import SwiftUI

struct LessonResourcesSection: View {
    let resources: [Lesson.Resource]
    @Binding var showingResourceLinks: Bool
    
    var body: some View {
        Text("Lesson Resources Section")
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    LessonResourcesSection(
        resources: MockData.binaryCommunicationLesson.resources,
        showingResourceLinks: .constant(false)
    )
}
