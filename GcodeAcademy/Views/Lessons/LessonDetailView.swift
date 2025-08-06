// LessonDetailView.swift
import SwiftUI

struct LessonDetailView: View {
    // State
    @State private var lesson: Lesson
    @State private var isVideoWatched = false
    @State private var completedGoals: Set<UUID> = []
    @State private var showingSlides = false
    @State private var selectedQuestionIndex: Int? = nil
    @State private var showingResourceLinks = false
    
    // Computed properties
    private var isLessonCompleted: Bool {
        // Consider lesson complete if video watched and all goals checked
        return isVideoWatched && completedGoals.count == lesson.goals.count
    }
    
    // Initialization
    init(lesson: Lesson) {
        _lesson = State(initialValue: lesson)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Custom top bar
            TopBar(title: lesson.title)
            
            // Main content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Overview section
                    LessonHeaderSection(
                        lesson: lesson,
                        isCompleted: isLessonCompleted
                    )
                    
                    // Video section
                    LessonVideoSection(
                        videoID: lesson.videoID ?? "",
                        isVideoWatched: $isVideoWatched
                    )
                    
                    // Learning goals section
                    LessonGoalsSection(
                        goals: lesson.goals,
                        completedGoals: $completedGoals
                    )
                    
                    // Content sections
                    LessonContentSection(
                        contentSections: lesson.contentSections
                    )
                    
                    // Slides section
                    LessonSlidesSection(
                        showingSlides: $showingSlides,
                        slidesURL: lesson.slidesURL
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
                }
                .padding()
            }
        }
        .background(Color.backgroundApp)
        .navigationBarHidden(true)
        .sheet(isPresented: $showingSlides) {
            LessonSlidesDetailView(
                showingSlides: $showingSlides,
                slidesURL: lesson.slidesURL
            )
        }
    }
}

#Preview {
    NavigationStack {
        LessonDetailView(lesson: LessonData.dataTypesLesson)
    }
}
