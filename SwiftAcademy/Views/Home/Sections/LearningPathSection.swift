// SwiftAcademy Views - LearningPathSection.
// Vertical list composing `LessonCard` entries and connector lines into a learning path.
// Determines unlocked lessons and arranges cards with alternating offsets.
import SwiftUI

struct LearningPathSection: View {
    let lessons: [Lesson]
    let lessonsCompleted: Int
    var onStartLesson: (Lesson) -> Void

    private var unlockedCount: Int {
        min(lessonsCompleted + 1, lessons.count)
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
                    if !isLast {
                        LessonConnectorLine(
                            isEven: isEven,
                            isUnlocked: isUnlocked && index + 1 < unlockedCount
                        )
                    }

                    LessonCard(
                        lesson: lesson,
                        index: index + 1,
                        isUnlocked: isUnlocked,
                        isNextLesson: index == lessonsCompleted,
                        onStartLesson: onStartLesson
                    )
                    .offset(x: isEven ? 70 : -70, y: -75)
                }

                if secondToLast {
                    Spacer().frame(height: 70)
                } else if !isLast {
                    Spacer().frame(height: 60)
                }
            }
        }
    }
}

#Preview {
    LearningPathSection(
        lessons: [
            LessonData.binaryLesson,
            LessonData.dataTypesLesson,
            LessonData.arraysListsLesson,
            LessonData.functionsLesson
        ],
        lessonsCompleted: 1
    ) { _ in }
}
