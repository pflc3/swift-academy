import SwiftUI

struct LearningPathSection: View {
    let lessons: [Lesson]
    @EnvironmentObject var user: User
    var onStartLesson: (Lesson) -> Void
    
    // Determine unlocked lessons based on user progress
    // Current lesson (next one to complete) is also unlocked
    var unlockedCount: Int {
        user.lessonsCompleted+1
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
                            isUnlocked: isUnlocked && index < unlockedCount+1
                        )
                    }
                    
                    // Position cards on alternating sides
                    LessonCard(
                        lesson: lesson,
                        index: index,
                        isUnlocked: isUnlocked,
                        isNextLesson: index == user.lessonsCompleted,
                        onStartLesson: onStartLesson
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
    LearningPathSection(
        lessons: [
            LessonData.binaryLesson,
            LessonData.dataTypesLesson,
            LessonData.binaryLesson,
            LessonData.dataTypesLesson,
        ],
        onStartLesson: { _ in /* Preview only */ }
    ).environmentObject(CurrentUser.user)
}
