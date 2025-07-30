import SwiftUI

struct LessonSlidesSection: View {
    @Binding var showingSlides: Bool
    
    var body: some View {
        Text("Lesson Slides Section")
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

struct LessonSlidesDetailView: View {
    @Binding var showingSlides: Bool
    
    var body: some View {
        Text("Slides Detail View")
            .padding()
    }
}

#Preview {
    LessonSlidesSection(showingSlides: .constant(false))
}
