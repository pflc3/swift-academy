import SwiftUI

struct BackgroundView: View {
    var length: Int
    
    // Using SF Symbols that are thematic for coding/learning
    let backgroundSymbols = [
        "swift", "curlybraces", "terminal", "chevron.left.forwardslash.chevron.right",
        "desktopcomputer","server.rack"
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background base color
            Color.backgroundApp.ignoresSafeArea()
            
            // Vertical stack of decorative symbols
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<length, id: \.self) { i in
                    BackgroundSymbol(
                        symbolName: backgroundSymbols[i % backgroundSymbols.count],
                        offsetX: i.isMultiple(of: 2) ? -120 : 128
                    )
                }
                Spacer()
            }
        }
    }
}

// Individual floating background symbol
struct BackgroundSymbol: View {
    var symbolName: String
    var offsetX: CGFloat
    
    var body: some View {
        Image(systemName: symbolName)
            .font(.system(size: 50))
            .foregroundColor(Color.primaryApp.opacity(0.12))
            .frame(width: 70, height: 70)
            .padding(10)
            .offset(x: offsetX, y: -10)
    }
}

#Preview {
    BackgroundView(length: 8)
}
