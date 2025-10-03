// LessonDetailViewModel.
// View model for lesson detail screens — tracks progress, completions, and UI state.
// Handles submit logic for marking lessons completed (delegates network calls to UserService).

import Foundation

/// View model for lesson details. Tracks UI state and coordinates marking completion.
@MainActor
final class LessonDetailViewModel: ObservableObject {
    @Published var lesson: Lesson
    @Published var isVideoWatched = false
    @Published var completedGoals: Set<UUID> = []
    @Published var showingSlides = false
    @Published var selectedQuestionIndex: Int?
    @Published var showingResourceLinks = false

    private var didSubmitCompletion = false
    private var session: SessionManager?
    private var userService: UserService?
    private var toasts: ToastCenter?
    private(set) var isConfigured = false

    /// Initialize the view model with a lesson to present.
    init(lesson: Lesson) {
        self.lesson = lesson
    }

    /// Configure runtime collaborators used for network calls and toast feedback.
    func configure(session: SessionManager, userService: UserService, toasts: ToastCenter) {
        guard !isConfigured else { return }
        self.session = session
        self.userService = userService
        self.toasts = toasts
        isConfigured = true
    }

    var progressPercentage: Double {
        var total = 0.0
        if isVideoWatched { total += 0.35 }
        if !lesson.goals.isEmpty {
            let weight = 0.65 / Double(lesson.goals.count)
            total += Double(completedGoals.count) * weight
        }
        return min(total, 1.0)
    }

    /// Boolean indicating whether the lesson is considered complete locally.
    var isCompleted: Bool { progressPercentage >= 1.0 }

    /// Attempt to mark the lesson complete for the logged-in user when
    /// local progress reaches 100%. Guards prevent duplicate submissions
    /// and ensure the lesson is the expected next lesson for the user.
    func submitCompletionIfEligible() {
        guard let session, let userService else { return }
        guard !didSubmitCompletion, isCompleted else { return }
        guard let idx = LessonData.allLessons.firstIndex(of: lesson) else { return }
        guard var user = session.user, idx == user.lessonsCompleted else { return }

        didSubmitCompletion = true

        if AppMode.useMocks {
            if var user = session.user { user.lessonsCompleted += 1; session.user = user }
            toasts?.show("Lesson completed! (Mock)")
            return
        }

        Task {
            do {
                try await userService.markLessonCompletedIfNeeded(for: lesson, user: &user)
                session.user = user
                toasts?.show("Lesson completed! 🎉")
            } catch {
                didSubmitCompletion = false
                toasts?.show("Failed to update progress", positive: false)
            }
        }
    }
}
