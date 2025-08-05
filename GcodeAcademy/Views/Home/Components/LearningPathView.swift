import SwiftUI

struct LearningPathView: View {
    let lessons: [Lesson]
    
    // This would come from user progress in a real implementation
    var unlockedCount: Int {
        // For demo, first 6 lessons are unlocked
        return min(6, lessons.count-1)
    }
    
    var body: some View {
        VStack {
            ForEach(lessons.indices, id: \.self) { index in
                let lesson = lessons[index]
                let isEven = index % 2 == 0
                let isLast = index == lessons.count - 1
                let secondToLast = index == lessons.count - 2
                let isUnlocked = index < unlockedCount
                
                ZStack {
                    // Draw connector, except last
                    if !isLast {
                        LessonConnectorLine(
                            isEven: isEven,
                            // Only color the connector if the next lesson is also unlocked
                            isUnlocked: isUnlocked && index+1 < unlockedCount
                        )
                    }
                    
                    // Position cards on alternating sides
                    LessonCard(
                        lesson: lesson,
                        index: index + 1,
                        isUnlocked: isUnlocked
                    )
                    .offset(
                        x: isEven ? 70 : -70,
                        y: -75
                    )
                }
                
                if secondToLast {
                    // Add extra space after second to last card
                    Spacer()
                        .frame(height: 70)
                } else if !isLast {
                    // Add space after each card, except last
                    Spacer()
                        .frame(height: 60)
                }
            }
        }
    }
}

#Preview {
    Spacer()
        .frame(height: 180)
    LearningPathView(lessons: [
        MockData.binaryCommunicationLesson,
        MockData.swiftDataTypesLesson,
        MockData.binaryCommunicationLesson,
        MockData.swiftDataTypesLesson,
    ])
}
