import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionManager
    @StateObject private var vm = HomeViewModel()
    
    var onShowingLessonDetail: ((Bool) -> Void)?
    
    private var lessons: [Lesson] { LessonData.allLessons }
    private var lessonsCompleted: Int { session.user?.lessonsCompleted ?? 0 }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .top) {
                    BackgroundView(length: vm.backgroundLength(for: lessons.count))

                    VStack {
                        HomeHeaderSection(
                            lessonsCompleted: lessonsCompleted,
                            totalLessons: lessons.count
                        )
                        .padding(.top, 25)
                        
                        LearningPathSection(
                            lessons: lessons,
                            lessonsCompleted: lessonsCompleted,
                            onStartLesson: { lesson in
                                vm.selectedLesson = lesson
                                vm.showLessonDetail = true
                            }
                        )
                        .padding(.top, 75)
                    }
                }
            }
            .background(Color.backgroundApp)
            .ignoresSafeArea(.all)
            .onChange(of: vm.showLessonDetail) { _, newValue in
                onShowingLessonDetail?(newValue)
            }
            .navigationDestination(isPresented: $vm.showLessonDetail) {
                if let lesson = vm.selectedLesson {
                    LessonDetailView(lesson: lesson)
                }
            }
        }
    }
}

#Preview {
    let deps = AppDependencies()
    deps.session.isBootstrapping = false
    deps.session.isAuthenticated = true
    deps.session.user = MockData.users[0]
    return HomeView()
        .environmentObject(deps.session)
}
