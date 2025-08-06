import SwiftUI

struct LessonCard: View {
    @State private var showPreview = false
    let lesson: Lesson
    let index: Int
    let isUnlocked: Bool
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
                            .fill(isUnlocked ? Color.primaryApp : Color(hex: "CED4DC"))
                            .frame(width: 36, height: 36)
                        
                        if isUnlocked {
                            // Show number if unlocked
                            Text("\(index)")
                                .font(.bodyMedium.bold())
                                .foregroundColor(.white)
                        } else {
                            // Show lock if locked
                            Image(systemName: "lock.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.textTertiaryApp)
                        }
                    }
                    
                    Spacer()
                }
                
                // Use the shorter title for the card display
                Text(lesson.shortTitle)
                    .font(.bodyLarge.bold())
                    .foregroundColor(isUnlocked ? .textPrimaryApp : .textTertiaryApp)
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
                                .fill(isUnlocked ? Color.surfaceApp : Color(hex: "CED4DC"))
                        )
                        .foregroundColor(isUnlocked ? .textSecondaryApp : .textTertiaryApp)
                    
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
                    .fill(isUnlocked ? Color.cardBackgroundApp : Color.surfaceApp) // Light gray for locked cards
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isUnlocked ? Color.clear : Color.dividerApp, lineWidth: 2)
                    )
            )
            .shadow(color: Color.black.opacity(isUnlocked ? 0.1 : 0.05), radius: 3, x: 0, y: 2) // Slightly less transparent for locked cards
        }
        .buttonStyle(PlainButtonStyle())
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
            onStartLesson: { _ in /* Preview only */ }
        )
    }
    
    ZStack {
        LessonConnectorLine(
            isEven: true,
            isUnlocked: true
        )

        LessonCard(
            lesson: LessonData.binaryLesson,
            index: 2,
            isUnlocked: false,
            onStartLesson: { _ in /* Preview only */ }
        )
    }
}
