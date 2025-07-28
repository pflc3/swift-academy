import SwiftUI

struct LessonDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Lesson Title")
                    .font(.largeTitle)
                    .bold()
                
                Text("This is where the lesson description will appear. It explains what the student will learn in this lesson.")
                    .padding(.bottom)
                
                Text("Lesson Content")
                    .font(.headline)
                
                Text("The actual lesson content will go here. This could include explanations, code examples, and interactive elements.")
            }
            .padding()
        }
        .navigationTitle("Lesson")
    }
}

#Preview {
    NavigationStack {
        LessonDetailView()
    }
}
