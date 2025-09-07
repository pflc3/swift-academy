import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var showLessonDetail = false
    @Published var selectedLesson: Lesson?
    
    func backgroundLength(for lessonCount: Int) -> Int {
        max(lessonCount, (135 * lessonCount + 100) / 50)
    }
}
