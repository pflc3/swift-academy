import SwiftUI

struct BackgroundView: View {
    var length: Int
    
    // Using SF Symbols that are thematic for coding/learning
    let backgroundSymbols = [
        "swift", "curlybraces", "terminal", "chevron.left.forwardslash.chevron.right",
        "desktopcomputer", "function", "flowchart", "slider.horizontal.3"
    ]
    
    var body: some View {
        ZStack {
            // Background base color
            Color.backgroundApp.ignoresSafeArea()
            
            // Vertical stack of decorative symbols - keeping student's animation approach
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<length, id: \.self) { i in
                    BackgroundSymbol(
                        symbolName: backgroundSymbols[i % backgroundSymbols.count],
                        offsetX: i.isMultiple(of: 2) ? 128 : -120
                    )
                }
                Spacer()
            }
        }
    }
}

// Individual floating background symbol - keeping student's animation
struct BackgroundSymbol: View {
    var symbolName: String
    var offsetX: CGFloat
    
    @State private var floatOffset: CGFloat = 0
    
    var body: some View {
        Image(systemName: symbolName)
            .font(.system(size: 60))
            .foregroundColor(Color.primaryApp.opacity(0.12))
            .frame(width: 70, height: 70)
            .padding(10)
            .offset(x: offsetX, y: floatOffset)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: Double.random(in: 3.0...4.5))
                        .repeatForever(autoreverses: true)
                ) {
                    floatOffset = CGFloat.random(in: -6...6)
                }
            }
    }
}

#Preview {
    BackgroundView(length: 6)
}
