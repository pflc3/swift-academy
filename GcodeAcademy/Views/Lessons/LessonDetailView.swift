import SwiftUI

// This view pulls together all the modular components to display a full lesson page
struct LessonDetailView: View {
    // Holds the current lesson data (replace with real model in future)
    @State private var lesson = MockData.binaryCommunicationLesson
    @State private var isVideoWatched = false
    @State private var completedGoals: Set<UUID> = []
    @State private var showingSlides = false
    @State private var selectedQuestionIndex: Int? = nil
    @State private var showingResourceLinks = false
    
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
                
                // Explanations, examples, and codr
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
        print("Navigating to previous lesson")
    }
}

#Preview {
    NavigationStack {
        LessonDetailView()
    }
}
