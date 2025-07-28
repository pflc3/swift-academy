import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Learning Path")
                    .font(.title)
                
                // Simple placeholder for lessons
                NavigationLink(destination:  LessonDetailView()) {
                    Text("Sample Lesson")
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle("Gcode Academy")
        }
    }
}

#Preview {
    HomeView()
}
