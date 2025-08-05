import SwiftUI

struct LessonDetailView: View {
    // Holds the current lesson data
    @State private var lesson: Lesson
    @State private var isVideoWatched = false
    @State private var completedGoals: Set<UUID> = []
    @State private var showingSlides = false
    @State private var selectedQuestionIndex: Int? = nil
    @State private var showingResourceLinks = false
    
    // Initialize with a lesson parameter
    init(lesson: Lesson) {
        // Initialize the @State property
        _lesson = State(initialValue: lesson)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Title and description of the lesson
                LessonHeaderSection(
                    lesson: lesson,
                    progressPercentage: progressPercentage
                )
                
                // Video content (Youtube embed)
                LessonVideoSection(
                    videoID: lesson.videoID ?? "",
                    isVideoWatched: $isVideoWatched
                )
                
                // Checklist of learning goals
                LessonGoalsSection(
                    goals: lesson.goals,
                    completedGoals: $completedGoals
                )
                
                // Explanations, examples, and code
                LessonContentSection(
                    contentSections: lesson.contentSections
                )
                
                // Small preview + full slides toggle
                LessonSlidesSection(
                    showingSlides: $showingSlides,
                    slidesURL: lesson.slidesURL
                )
                
                // Interactive multiple choice question
                LessonQuestionsSection(
                    questions: lesson.questions,
                    selectedQuestionIndex: $selectedQuestionIndex
                )
                
                // Optional links for further learning
                LessonResourcesSection(
                    resources: lesson.resources,
                    showingResourceLinks: $showingResourceLinks
                )
                
                // Navigation buttons to move between lessons
                LessonNavControls(
                    onPrevious: navigateToPreviousLesson,
                    onNext: navigateToNextLesson
                )
            }
            .padding()
        }
        // Google Slides sheet shown when user taps "View All Slides"
        .sheet(isPresented: $showingSlides) {
            LessonSlidesDetailView(
                showingSlides: $showingSlides,
                slidesURL: lesson.slidesURL
            )
        }
    }
    
    // Calculates overall progress for this lesson
    private var progressPercentage: Double {
        var total = 0.0
        
        // Watching the video is worth 35%
        if isVideoWatched {
            total += 0.35
        }
        
        // Completed goals is worth 65%
        if !lesson.goals.isEmpty {
            let goalWeight = 0.65 / Double(lesson.goals.count)
            total += Double(completedGoals.count) * goalWeight
        }
        
        return total
    }
    
    private func navigateToPreviousLesson() {
        // TODO: Add logic for navigating back
        print("Navigating to previous lesson")
    }
    
    private func navigateToNextLesson() {
        // TODO: Add logic for navigating forward
        print("Navigating to next lesson")
    }
}

// Update the preview to pass a lesson
#Preview {
    NavigationStack {
        LessonDetailView(lesson: MockData.swiftDataTypesLesson)
    }
}
