import SwiftUI

struct HomeView: View {
    // State variables to track user data
    @EnvironmentObject var user: User
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
                        HomeHeaderSection(lessons: LessonData.allLessons)
                            .padding(.top, 25)
                        
                        // Learning path view
                        LearningPathSection(
                            lessons: LessonData.allLessons,
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
                        .environmentObject(user) // Pass the environment object to detail view
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
        .environmentObject(MockData.users[0])
}
