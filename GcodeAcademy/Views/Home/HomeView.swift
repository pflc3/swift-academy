import SwiftUI

struct HomeView: View {
    // Using your project's lesson data
    let lessons = [
        MockData.binaryCommunicationLesson,
        MockData.swiftDataTypesLesson
    ]
    
    // For demo purposes, repeat lessons to show more in the path
    var allLessons: [Lesson] {
        var result: [Lesson] = []
        // Repeat lessons to have 8 total for demonstration
        for i in 0..<lessons.count {
            result.append(lessons[i % 2])
        }
        return result
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                // Keep student's background with floating icons
                BackgroundView(length: backgroundLength(for: allLessons.count))
                    .ignoresSafeArea()
                
                LessonHeader(user: MockData.currentUser, Lessons: lessons)
            }
        }
        .background(Color.backgroundApp)
    }
    
    // Keep student's background length calculation
    private func backgroundLength(for lessonCount: Int) -> Int {
        let estimatedFill = Int(UIScreen.main.bounds.height / 180) + 2
        return max(lessonCount, estimatedFill)
    }
}

#Preview {
    HomeView()
}


