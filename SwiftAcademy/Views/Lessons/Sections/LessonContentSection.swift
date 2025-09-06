import SwiftUI

// Display lesson content sections with optional code examples
struct LessonContentSection: View {
    let contentSections: [Lesson.ContentSection] // Each section included title, text, optional code
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Loop through each section in the content
            ForEach(contentSections) { section in
                VStack(alignment: .leading, spacing: 8) {
                    // Section title
                    Text(section.title)
                        .font(.titleMedium)
                        .foregroundColor(.textPrimaryApp)
                    
                    // Main lesson explanation
                    Text(section.content)
                        .font(.bodyMedium)
                        .foregroundColor(.textSecondaryApp)
                    // Optional code block (swift)
                    if let code = section.codeExample {
                        CodeBlock(code: code, language: "swift")
                    }
                }
                .padding(.bottom,16) // Space between sections
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x:0, y:1)
    }
}

#Preview {
    LessonContentSection(
        contentSections: LessonData.binaryLesson.contentSections
    )
    .padding()
}
