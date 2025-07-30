import SwiftUI

// Multiple-choice questions for lesson comprehension
struct LessonQuestionsSection: View {
    let questions: [Lesson.Question]                // Questions passed from lesson model
    @Binding var selectedQuestionIndex: Int?        // Tracks which question is open

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
                            Button(action: {
                                // Could add answer logic here later
                            }) {
                                HStack {
                                    Text(option)
                                        .font(.bodyMedium)
                                        .foregroundColor(.textPrimaryApp)
                                    
                                    Spacer()
                                    
                                    // Show checkmark only for correct option
                                    if question.correctOptionIndex == optionIndex {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.successApp)
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.surfaceApp)
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    } else {
                        // Button to reveal options
                        Button(action: {
                            selectedQuestionIndex = index
                        }) {
                            Text("Show Options")
                                .font(.bodyMedium)
                                .foregroundColor(.primaryApp)
                                .padding(.vertical, 8)
                        }
                    }
                }
                .padding(.vertical, 10)
            }
        }
        .padding(16)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.03), radius: 3, x: 0, y: 1)
    }
}

// Preview
#Preview {
    LessonQuestionsSection(
        questions: MockData.binaryCommunicationLesson.questions,
        selectedQuestionIndex: .constant(nil)
    )
    .padding()
}
