// LessonHeaderSection.
// Presents lesson summary, difficulty, duration, and a compact progress indicator.
// Invokes `onCompleted` when the lesson reaches completed state to surface UI feedback.

import SwiftUI

struct LessonHeaderSection: View {
    let lesson: Lesson
    let progressPercentage: Double
    var onCompleted: () -> Void = {}

    private var percent: Int { Int(progressPercentage * 100.0) }
    private var isCompleted: Bool { percent >= 100 }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(lesson.description)
                .font(.bodyLarge)
                .foregroundColor(.textSecondaryApp)
                .padding(.top, 4)

            HStack(spacing: 16) {
                Label {
                    Text(lesson.difficulty.rawValue)
                        .font(.bodySmall)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "chart.bar")
                        .foregroundColor(.primaryApp)
                        .font(.system(size: 19))
                }

                Label {
                    Text("\(lesson.duration) minutes")
                        .font(.bodySmall)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "clock")
                        .foregroundColor(.primaryApp)
                        .font(.system(size: 19))
                }

                Spacer()

                HStack(spacing: 6) {
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.accentApp)
                            .font(.system(size: 19))
                        Text("Completed")
                            .font(.bodySmall)
                            .foregroundColor(.accentApp)
                            .onAppear { onCompleted() }
                    } else {
                        ZStack {
                            Circle()
                                .stroke(Color.dividerApp, lineWidth: 2)
                                .frame(width: 20, height: 20)
                            Circle()
                                .trim(from: 0, to: CGFloat(progressPercentage))
                                .stroke(Color.accentApp, lineWidth: 2)
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(-90))
                            Text("\(percent)")
                                .font(.system(size: 10, weight: percent > 0 ? .bold : .regular))
                                .foregroundColor(percent > 0 ? .accentApp : .textSecondaryApp)
                        }
                        Text("Progress")
                            .font(.bodySmall)
                            .foregroundColor(.textSecondaryApp)
                            .padding(.leading, 3)
                    }
                }
            }
        }
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    VStack(spacing: 20) {
        LessonHeaderSection(lesson: LessonData.binaryLesson, progressPercentage: 0.0)
        LessonHeaderSection(lesson: LessonData.binaryLesson, progressPercentage: 0.65)
        LessonHeaderSection(lesson: LessonData.binaryLesson, progressPercentage: 1.0)
    }
    .padding()
    .background(Color.backgroundApp)
}
