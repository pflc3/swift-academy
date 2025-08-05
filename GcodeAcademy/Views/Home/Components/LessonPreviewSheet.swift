import SwiftUI

struct LessonPreviewSheet: View {
    let lesson: Lesson
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
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
            .padding(.bottom, 16)
            
            // Description
            Text(lesson.description)
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            
            Divider().background(Color.dividerApp)
            
            // Learning goals preview - simplified from student's implementation
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("What You'll Learn")
                        .font(.titleSmall)
                        .foregroundColor(.textPrimaryApp)
                        .padding(.top, 16)
                    
                    ForEach(lesson.goals) { goal in
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
                    
                    // Quick overview of sections
                    if !lesson.contentSections.isEmpty {
                        Text("Content Overview")
                            .font(.titleSmall)
                            .foregroundColor(.textPrimaryApp)
                            .padding(.top, 16)
                        
                        // Just show section titles
                        ForEach(lesson.contentSections) { section in
                            HStack {
                                Image(systemName: "doc.text")
                                    .foregroundColor(.primaryApp)
                                
                                Text(section.title)
                                    .font(.bodyMedium)
                                    .foregroundColor(.textPrimaryApp)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
            
            // Action buttons
            NavigationLink(destination: LessonDetailView(lesson: lesson)) {
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
        .presentationDetents([.medium])
        .presentationCornerRadius(16)
    }
}

#Preview {
    LessonPreviewSheet(
        lesson: MockData.binaryCommunicationLesson,
        isPresented: .constant(true)
    )
}
