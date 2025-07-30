import SwiftUI

struct LessonNavControls: View {
    var onPrevious: () -> Void
    var onNext: () -> Void
    
    var body: some View {
        HStack {
            Text("Previous")
                .padding()
            
            Spacer()
            
            Text("Next")
                .padding()
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    LessonNavControls(
        onPrevious: {},
        onNext: {}
    )
}
