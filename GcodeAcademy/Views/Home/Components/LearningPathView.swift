import SwiftUI

struct LearningPathView: View {
    let lessons: [Lesson]
    
    // This would come from user progress in a real implementation
    var unlockedCount: Int {
        return min(3, lessons.count) // For demo, first 3 lessons are unlocked
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 60) // Space for the header
            
            ForEach(lessons.indices, id: \.self) { index in
                let lesson = lessons[index]
                let isEven = index % 2 == 0
                let isLast = index == lessons.count - 1
                let isUnlocked = index < unlockedCount
                
                ZStack {
                    // Keep their diagonal connector line implementation
                    if !isLast {
                        LessonConnectorLine(
                            isEven: isEven,
                            isUnlocked: isUnlocked,
                            isFirst: index == 0
                        )
                    }
                    
                    // Keep their lesson positioning
                    LessonCard(
                        lesson: lesson,
                        index: index + 1,
                        isUnlocked: isUnlocked
                    )
                    .offset(
                        x: isEven ? 70 : -70,
                        y: index == 0 ? 0 : -90
                    )
                }
            }
            
            Spacer(minLength: 40)
        }
    }
}

#Preview {
    LearningPathView(lessons: [
        MockData.binaryCommunicationLesson,
        MockData.swiftDataTypesLesson,
        MockData.binaryCommunicationLesson,
        MockData.swiftDataTypesLesson
    ])
}
