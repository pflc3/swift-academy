import SwiftUI

struct LessonConnectorLine: View {
    var isEven: Bool
    var isUnlocked: Bool
    var isFirst: Bool
    
    var body: some View {
        Rectangle()
            .fill(isUnlocked ? Color.primaryApp : Color.dividerApp)
            .frame(width: 3, height: isFirst ? 180 : 195)
            .offset(
                x: isEven ? (isFirst ? 30 : -1) : 1,
                y: isFirst ? 30 : 15
            )
            .rotationEffect(Angle(degrees: isEven ? (isFirst ? 45 : 40) : -40))
    }
}

#Preview {
    VStack {
        LessonConnectorLine(isEven: true, isUnlocked: true, isFirst: true)
        LessonConnectorLine(isEven: false, isUnlocked: false, isFirst: false)
    }
    .frame(width: 300, height: 500)
    .background(Color.backgroundApp)
}
