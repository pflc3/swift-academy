// HomeViewModel.
// Lightweight view model holding selection state for HomeView and helper methods.
// Keeps presentation state decoupled from UI views.

import Foundation

/// View model for the home screen. Holds selection state and small presentation helpers.
@MainActor
final class HomeViewModel: ObservableObject {
    @Published var showLessonDetail = false
    @Published var selectedLesson: Lesson?

    /// Compute a length value used by the background view layout. Keeps formula
    /// centralized to simplify testing and visual adjustments.
    func backgroundLength(for lessonCount: Int) -> Int {
        max(lessonCount, (135 * lessonCount + 100) / 50)
    }
}
