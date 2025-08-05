import SwiftUI

struct LessonCard: View {
    @State private var showPreview = false
    let lesson: Lesson
    let index: Int
    let isUnlocked: Bool
    
    var body: some View {
        Button {
            if isUnlocked {
                showPreview.toggle()
            }
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                // Header with number and status
                HStack {
                    // Number indicator
                    ZStack {
                        Circle()
                            .fill(isUnlocked ? Color.primaryApp : Color.surfaceApp)
                            .frame(width: 36, height: 36)
                        
                        Text("\(index)")
                            .font(.bodyMedium.bold())
                            .foregroundColor(isUnlocked ? .white : .textSecondaryApp)
                    }
                    
                    Spacer()
                    
                    // Lock/unlock icon like student's implementation
                    Image(systemName: isUnlocked ? "book.fill" : "lock.fill")
                        .foregroundColor(isUnlocked ? .accentApp : .textTertiaryApp)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(Color.surfaceApp)
                                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        )
                }
                
                // Lesson title
                Text(lesson.title)
                    .font(.bodyLarge.bold())
                    .foregroundColor(isUnlocked ? .textPrimaryApp : .textTertiaryApp)
                    .lineLimit(2)
                
                // Lesson metadata
                HStack {
                    // Difficulty tag from student's design
                    Text(lesson.difficulty)
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
                    Label(lesson.duration, systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.textTertiaryApp)
                }
            }
            .padding()
            .frame(width: 200)
            .background(Color.cardBackgroundApp)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(isUnlocked ? 0.1 : 0.05), radius: 3, x: 0, y: 2)
            .opacity(isUnlocked ? 1.0 : 0.8)
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!isUnlocked)
        .sheet(isPresented: $showPreview) {
            LessonPreviewSheet(lesson: lesson, isPresented: $showPreview)
        }
    }
}

#Preview {
    VStack {
        LessonCard(lesson: MockData.binaryCommunicationLesson, index: 1, isUnlocked: true)
        LessonCard(lesson: MockData.swiftDataTypesLesson, index: 2, isUnlocked: false)
    }
    .padding()
    .background(Color.backgroundApp)
}
