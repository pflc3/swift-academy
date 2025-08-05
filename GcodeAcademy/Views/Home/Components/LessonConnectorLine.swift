import SwiftUI

struct LessonConnectorLine: View {
    var isEven: Bool
    var isUnlocked: Bool
    
    var body: some View {
        // Diagonal line connecting lessons
        Rectangle()
            .fill(isUnlocked ? Color.primaryApp : Color(.systemGray4))
            .frame(width: 3, height: 180) // Consistent height
            .offset(y: 60) // Position it lower to connect cards
            .rotationEffect(Angle(degrees: isEven ? 45 : -45)) // Consistent angle
    }
}

#Preview {
    VStack {
        LessonConnectorLine(isEven: true, isUnlocked: true)
        LessonConnectorLine(isEven: false, isUnlocked: true)
        LessonConnectorLine(isEven: true, isUnlocked: false)
    }
    .frame(width: 500, height: 1000)
    .background(Color.backgroundApp)
}
