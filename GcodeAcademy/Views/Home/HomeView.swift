import SwiftUI

struct HomeView: View {
    // State variables to track user data
    @State private var user = MockData.currentUser
    @State private var showLessonDetail = false
    @State private var selectedLesson: Lesson?
    
    // Callback to notify ContentView about lesson detail visibility
    var onShowingLessonDetail: ((Bool) -> Void)?

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .top) {
                    // Keep student's background with floating icons
                    BackgroundView(length: backgroundLength(for: LessonData.allLessons.count))

                    VStack {
                        HomeHeaderSection(user: user, lessons: LessonData.allLessons)
                            .padding(.top, 25)
                        
                        // Learning path view
                        LearningPathSection(
                            lessons: LessonData.allLessons,
                            user: user,
                            onStartLesson: { lesson in
                                // Set the selected lesson and trigger navigation
                                selectedLesson = lesson
                                showLessonDetail = true
                            }
                        )
                        .padding(.top, 75)
                    }
                }
            }
            .background(Color.backgroundApp)
            .ignoresSafeArea(.all)
            .onChange(of: showLessonDetail) {
                // Notify ContentView about navbar visibility
                onShowingLessonDetail?(showLessonDetail)
            }
            .navigationDestination(isPresented: $showLessonDetail) {
                if let lesson = selectedLesson {
                    LessonDetailView(lesson: lesson)
                }
            }
        }
    }
    
    // Keep student's background length calculation
    private func backgroundLength(for lessonCount: Int) -> Int {
        return max(lessonCount, (135*lessonCount+100)/50)
    }
}

#Preview {
    HomeView()
}
