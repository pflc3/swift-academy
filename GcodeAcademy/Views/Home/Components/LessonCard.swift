import SwiftUI

struct SolidButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct LessonCard: View {
    @State private var showPreview = false
    let lesson: Lesson
    let index: Int
    let isUnlocked: Bool
    let isNextLesson: Bool
    var onStartLesson: (Lesson) -> Void
    
    var body: some View {
        Button {
            if isUnlocked {
                showPreview.toggle()
            }
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                // Header with number or lock
                HStack {
                    // Number or lock indicator
                    ZStack {
                        Circle()
                            .fill(isUnlocked ? Color.primaryApp : Color(hex: "CED4DC").opacity(0.75))
                            .frame(width: 36, height: 36)
                        
                        if isUnlocked {
                            // Show number if unlocked
                            Text("\(index+1)")
                                .font(.bodyMedium.bold())
                                .foregroundColor(.white)
                        } else {
                            // Show lock if locked
                            Image(systemName: "lock.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.textTertiaryApp.opacity(0.75))
                        }
                    }
                    
                    Spacer()
                    
                    // Blue "Next" badge
                    if isNextLesson {
                        Text("Next")
                            .font(.bodySmall)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 3)
                            .background(
                                Capsule()
                                    .fill(Color.primaryApp.opacity(0.15))
                            )
                            .foregroundColor(Color.primaryApp)
                    }
                }
                
                // Use the shorter title for the card display
                Text(lesson.shortTitle)
                    .font(.bodyLarge.bold())
                    .foregroundColor(isUnlocked ? .textPrimaryApp : .textTertiaryApp.opacity(0.75))
                    .lineLimit(1) // Ensure it stays on one line
                
                // Lesson metadata
                HStack {
                    // Difficulty tag
                    Text(lesson.difficulty.rawValue)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(isUnlocked ? Color.surfaceApp : Color(hex: "CED4DC").opacity(0.75))
                        )
                        .foregroundColor(isUnlocked ? .textSecondaryApp : .textTertiaryApp.opacity(0.75))
                    
                    Spacer()
                    
                    // Duration
                    Label("\(lesson.duration)", systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.textTertiaryApp)
                }
            }
            .padding()
            .frame(width: 200)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isUnlocked ? Color.cardBackgroundApp : Color.surfaceApp)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isUnlocked ? Color.clear : Color.dividerApp, lineWidth: 2)
                    )
            )
            .shadow(color: Color.black.opacity(isUnlocked ? 0.1 : 0.05), radius: 3, x: 0, y: 2)
        }
        .buttonStyle(SolidButtonStyle())
        .sheet(isPresented: $showPreview) {
            LessonPreviewSheet(
                lesson: lesson,
                isPresented: $showPreview,
                onStartLesson: onStartLesson
            )
        }
    }
}

#Preview {
    ZStack {
        LessonConnectorLine(
            isEven: true,
            isUnlocked: true
        )

        LessonCard(
            lesson: LessonData.binaryLesson,
            index: 1,
            isUnlocked: true,
            isNextLesson: false,
            onStartLesson: { _ in /* Preview only */ }
        )
    }
    
    ZStack {
        LessonConnectorLine(
            isEven: false,
            isUnlocked: true
        )

        LessonCard(
            lesson: LessonData.binaryLesson,
            index: 2,
            isUnlocked: true,
            isNextLesson: true,
            onStartLesson: { _ in /* Preview only */ }
        )
    }
    
    ZStack {
        LessonConnectorLine(
            isEven: true,
            isUnlocked: false
        )

        LessonCard(
            lesson: LessonData.binaryLesson,
            index: 3,
            isUnlocked: false,
            isNextLesson: false,
            onStartLesson: { _ in /* Preview only */ }
        )
    }
}
