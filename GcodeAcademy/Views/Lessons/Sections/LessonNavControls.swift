import SwiftUI

// Navagation controls for moving between lessons
struct LessonNavControls: View {
    var onPrevious: () -> Void  // Callback for previous lesson
    var onNext: () -> Void      // Callback for next lesson
    
    var body: some View {
        HStack {
            // Previous button (outlined)
            Button(action: onPrevious) {
                Label("Previous", systemImage: "arrow.left")
                    .font(.bodyMedium)
                    .foregroundColor(.primaryApp)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.primaryApp, lineWidth: 1)
                    )
            }
            
            Spacer()
            
            // Next button (filled)
            Button(action: onNext) {
                Label("Next Lesson", systemImage: "arrow.right")
                    .font(.bodyMedium)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.primaryApp)
                    )
                    .cornerRadius(8)
            }
        }
        .padding(.top, 10)
    }
}

//Preview with dummy handlers
#Preview {
    LessonNavControls(
        onPrevious: { print("Back pressed") },
        onNext: { print("Next pressed") }
    )
    .padding()
}
