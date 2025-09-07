import SwiftUI

struct LessonPreviewSheet: View {
    let lesson: Lesson
    @Binding var isPresented: Bool
    var onStartLesson: (Lesson) -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "xmark")
                    .padding(8)
                    .clipShape(Circle())
                    .opacity(0)
                Spacer()
                Text(lesson.title)
                    .font(.titleMedium)
                    .foregroundColor(.textPrimaryApp)
                Spacer()
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.textPrimaryApp)
                        .padding(8)
                        .background(Color.surfaceApp)
                        .clipShape(Circle())
                }
            }
            .padding(.top, 24)
            .padding(.horizontal, 20)
            .padding(.bottom, 12)

            Text(lesson.description)
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
                .lineLimit(3)
                .padding(.horizontal, 20)
                .padding(.bottom, 12)

            Divider()
                .background(Color.dividerApp)
                .padding(.horizontal, 16)

            VStack(alignment: .leading, spacing: 10) {
                Text("What You'll Learn")
                    .font(.titleSmall)
                    .foregroundColor(.textPrimaryApp)
                ForEach(lesson.goals.prefix(2)) { goal in
                    HStack(alignment: .top) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.accentApp)
                            .font(.caption)
                            .padding(.top, 2)
                        Text(goal.description)
                            .font(.bodyMedium)
                            .foregroundColor(.textSecondaryApp)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 12)

            Spacer()

            Button {
                isPresented = false
                onStartLesson(lesson)
            } label: {
                Text("Start Lesson")
                    .font(.bodyLarge.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.primaryApp)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.backgroundApp)
        .presentationDetents([.height(350)])
        .presentationCornerRadius(16)
    }
}

#Preview {
    LessonPreviewSheet(
        lesson: LessonData.binaryLesson,
        isPresented: .constant(true)
    ) { _ in /* Preview only */ }
}
