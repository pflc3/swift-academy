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
                            .fill(isUnlocked ? Color.primaryApp : Color.surfaceApp)
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
                                .foregroundColor(.textSecondaryApp)
                        }
                    }
                    
                    Spacer()
                }
                
                // Use the shorter title for the card display
                Text(lesson.shortTitle)
                    .font(.bodyLarge.bold())
                    .foregroundColor(isUnlocked ? .textPrimaryApp : .textSecondaryApp)
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
                                .fill(Color.surfaceApp)
                        )
                        .foregroundColor(.textSecondaryApp)
                    
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
                    .fill(Color.cardBackgroundApp)
                    .overlay(
                        // Add a subtle border for locked cards to make them more distinguishable
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isUnlocked ? Color.clear : Color.dividerApp, lineWidth: 1.5)
                    )
            )
            .shadow(color: Color.black.opacity(isUnlocked ? 0.1 : 0.05), radius: 3, x: 0, y: 2) // Slightly less transparent for locked cards
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!isUnlocked)
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
    VStack {
        LessonCard(
            lesson: LessonData.binaryLesson,
            index: 1,
            isUnlocked: true,
            onStartLesson: { _ in /* Preview only */ }
        )
        LessonCard(
            lesson: LessonData.arraysListsLesson,
            index: 2,
            isUnlocked: false,
            onStartLesson: { _ in /* Preview only */ }
        )
    }
    .padding()
    .background(Color.backgroundApp)
}
