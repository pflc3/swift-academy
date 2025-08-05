import SwiftUI

struct HomeView: View {

    var body: some View {
        ScrollView {
            ZStack {
                // Keep student's background with floating icons
                BackgroundView(length: backgroundLength(for: lessons.count))
                    .ignoresSafeArea()
                
                LessonHeader(user: MockData.currentUser, Lessons: lessons)
            }
        }
        .background(Color.backgroundApp)
    }
    
    // Keep student's background length calculation
    private func backgroundLength(for lessonCount: Int) -> Int {
        let estimatedFill = Int(UIScreen.main.bounds.height / 90) + 2
        print(UIScreen.main.bounds.height)
        print(estimatedFill)
        return max(lessonCount, (135*lessonCount+100)/50)
        
    }
}

#Preview {
    HomeView()
}


