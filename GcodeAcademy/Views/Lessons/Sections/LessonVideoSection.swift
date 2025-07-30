import SwiftUI

struct LessonVideoSection: View {
    let videoID: String
    @Binding var isVideoWatched: Bool
    
    var body: some View {
        Text("Lesson Video Section")
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    LessonVideoSection(
        videoID: "example",
        isVideoWatched: .constant(false)
    )
}
