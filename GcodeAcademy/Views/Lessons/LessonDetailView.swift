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
    
    private var progressPercentage: Double {
        var total = 0.0
        if isVideoWatched {
            total += 0.35
        }
        if !lesson.goals.isEmpty {
            let goalWeight = 0.65 / Double(lesson.goals.count)
            total += Double(completedGoals.count) * goalWeight
        }
        return total
    }

    private var isFirstTwoLessons: Bool {
        let firstTwoLessonIds = [
            LessonData.allLessons[0].id,
            LessonData.allLessons[1].id
        ].compactMap { $0 }
        return firstTwoLessonIds.contains(lesson.id)
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
                        progressPercentage: progressPercentage
                    ).environmentObject(CurrentUser.user)
                    
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
                        slidesURL: lesson.slidesURL,
                        slideThumbnails: lesson.slideThumbnails
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
                    
                    // Completion hint for first two lessons only
                    if isFirstTwoLessons {
                        CompletionHintView()
                    }
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

struct CompletionHintView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "lightbulb.fill")
                .foregroundColor(.accentApp.opacity(0.8))
                .font(.system(size: 18))
            
            Text("To complete this lesson, mark the video as watched and check off all learning goals.")
                .font(.callout)
                .foregroundColor(.textSecondaryApp)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
    }
}

#Preview {
    NavigationStack {
        LessonDetailView(lesson: LessonData.allLessons[1])
    }
}
