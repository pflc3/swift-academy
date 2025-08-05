import SwiftUI

struct HomeView: View {
    // State variables to track user data
    @State private var user = MockData.currentUser

    var body: some View {
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
                        user: user
                    )
                    .padding(.top, 75)
                }
            }
        }
        .background(Color.backgroundApp)
    }
    
    // Keep student's background length calculation
    private func backgroundLength(for lessonCount: Int) -> Int {
        return max(lessonCount, (135*lessonCount+100)/50)
    }
}

#Preview {
    HomeView()
}
