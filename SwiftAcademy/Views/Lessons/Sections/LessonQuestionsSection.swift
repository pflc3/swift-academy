// SwiftAcademy Views - LessonQuestionsSection.
// Displays multiple-choice comprehension questions and simple grading UI.
// Supports expanding a question to reveal options and marking answers.
import SwiftUI

struct LessonQuestionsSection: View {
    let questions: [Lesson.Question]  // Questions passed from lesson model
    @Binding var selectedQuestionIndex: Int?  // Tracks which question is expanded
    @State private var selectedOptions: [Int: Int] = [:] // [questionIndex: selectedOptionIndex]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Section title
            Text("Check Your Understanding")
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)

            // List of questions
            ForEach(Array(questions.enumerated()), id: \.element.id) { index, question in
                VStack(alignment: .leading, spacing: 10) {
                    // Question text
                    Text("\(index + 1). \(question.text)")
                        .font(.bodyMedium)
                        .foregroundColor(.textPrimaryApp)

                    if selectedQuestionIndex == index {
                        // Show answer options
                        ForEach(Array(question.options.enumerated()), id: \.offset) { optionIndex, option in
                            Button(
                                action: { selectedOptions[index] = optionIndex },
                                label: {
                                    HStack {
                                        Text(option)
                                            .font(.bodyMedium)
                                            .foregroundColor(.textPrimaryApp)

                                        Spacer()

                                        if let selected = selectedOptions[index], selected == optionIndex {
                                            let isCorrect = optionIndex == question.correctOptionIndex
                                            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark")
                                                .foregroundColor(isCorrect ? .successApp : .red)
                                        }
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8).fill(Color.surfaceApp)
                                    )
                                }
                            )
                            .buttonStyle(.plain)
                        }
                    } else {
                        // Button to reveal options
                        Button(
                            action: { selectedQuestionIndex = index },
                            label: {
                                Text("Show Options")
                                    .font(.bodyMedium)
                                    .foregroundColor(.primaryApp)
                                .padding(.vertical, 8)
                            }
                        )
                    }
                }
                .padding(.vertical, 10)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}

// Preview
#Preview {
    LessonQuestionsSection(
        questions: LessonData.binaryLesson.questions,
        selectedQuestionIndex: .constant(nil)
    )
    .padding()
}
