import Foundation

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
    
    init(lesson: Lesson) {
        self.lesson = lesson
    }
    
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
    
    var isCompleted: Bool { progressPercentage >= 1.0 }
    
    func submitCompletionIfEligible() {
        guard let session, let userService else { return }
        guard !didSubmitCompletion, isCompleted else { return }
        guard let idx = LessonData.allLessons.firstIndex(of: lesson) else { return }
        guard var user = session.user, idx == user.lessonsCompleted else { return }

        didSubmitCompletion = true
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
