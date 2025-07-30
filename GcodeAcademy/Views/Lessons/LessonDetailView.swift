import SwiftUI

struct LessonDetailView: View {
    // State variables
    @State private var lesson = MockData.binaryCommunicationLesson
    @State private var isVideoWatched = false
    @State private var completedGoals: Set<UUID> = []
    @State private var showingSlides = false
    @State private var selectedQuestionIndex: Int? = nil
    @State private var showingResourceLinks = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header section
                LessonHeaderSection(
                    lesson: lesson,
                    progressPercentage: progressPercentage
                )
                
                // Video section
                LessonVideoSection(
                    videoID: lesson.videoID ?? "",
                    isVideoWatched: $isVideoWatched
                )
                
                // Goals section
                LessonGoalsSection(
                    goals: lesson.goals,
                    completedGoals: $completedGoals
                )
                
                // Content section
                LessonContentSection(
                    contentSections: lesson.contentSections
                )
                
                // Slides section
                LessonSlidesSection(
                    showingSlides: $showingSlides
                )
                
                // Questions section
                LessonQuestionsSection(
                    questions: lesson.questions,
                    selectedQuestionIndex: $selectedQuestionIndex
                )
                
                // Resources section
                LessonResourcesSection(
                    resources: lesson.resources,
                    showingResourceLinks: $showingResourceLinks
                )
                
                // Navigation controls
                LessonNavControls(
                    onPrevious: navigateToPreviousLesson,
                    onNext: navigateToNextLesson
                )
            }
            .padding()
        }
        .sheet(isPresented: $showingSlides) {
            LessonSlidesDetailView(showingSlides: $showingSlides)
        }
    }
    
    // Helper methods
    private var progressPercentage: Double {
        // Simple placeholder calculation
        return 0.4
    }
    
    private func navigateToPreviousLesson() {
        // Placeholder
    }
    
    private func navigateToNextLesson() {
        // Placeholder
    }
}

#Preview {
    LessonDetailView()
}
