import SwiftUI

struct LessonDetailView: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var userService: UserService
    @EnvironmentObject var toasts: ToastCenter

    @StateObject private var vm: LessonDetailViewModel

    init(lesson: Lesson) {
        _vm = StateObject(wrappedValue: LessonDetailViewModel(lesson: lesson))
    }

    private var isFirstTwoLessons: Bool {
        let ids = Array(LessonData.allLessons.prefix(2)).map { $0.id }
        return ids.contains(vm.lesson.id)
    }

    var body: some View {
        VStack(spacing: 0) {
            TopBar(title: vm.lesson.title)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    LessonHeaderSection(
                        lesson: vm.lesson,
                        progressPercentage: vm.progressPercentage
                    ) { vm.submitCompletionIfEligible() }

                    LessonVideoSection(
                        videoID: vm.lesson.videoID ?? "",
                        isVideoWatched: $vm.isVideoWatched
                    )

                    LessonGoalsSection(
                        goals: vm.lesson.goals,
                        completedGoals: $vm.completedGoals
                    )

                    LessonContentSection(
                        contentSections: vm.lesson.contentSections
                    )

                    LessonSlidesSection(
                        showingSlides: $vm.showingSlides,
                        slidesURL: vm.lesson.slidesURL,
                        slideThumbnails: vm.lesson.slideThumbnails
                    )

                    LessonQuestionsSection(
                        questions: vm.lesson.questions,
                        selectedQuestionIndex: $vm.selectedQuestionIndex
                    )

                    LessonResourcesSection(
                        resources: vm.lesson.resources,
                        showingResourceLinks: $vm.showingResourceLinks
                    )

                    if isFirstTwoLessons {
                        CompletionHintView()
                    }
                }
                .padding()
            }
        }
        .background(Color.backgroundApp)
        .navigationBarHidden(true)
        .sheet(isPresented: $vm.showingSlides) {
            LessonSlidesDetailView(
                showingSlides: $vm.showingSlides,
                slidesURL: vm.lesson.slidesURL
            )
        }
        .onAppear {
            vm.configure(session: session, userService: userService, toasts: toasts)
        }
        .onChange(of: vm.progressPercentage) { _, newValue in
            if newValue >= 1.0 { vm.submitCompletionIfEligible() }
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
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let deps = PreviewDeps(user: MockData.users.first)
    return LessonDetailView(lesson: LessonData.binaryLesson).previewEnv(deps)
}
