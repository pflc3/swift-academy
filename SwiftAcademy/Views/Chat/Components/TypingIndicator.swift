// TypingIndicator.
// Small animated indicator shown while the chat assistant is composing a reply.

import SwiftUI

struct TypingIndicator: View {
    @State private var showFirstDot = false
    @State private var showSecondDot = false
    @State private var showThirdDot = false

    var body: some View {
        HStack(spacing: 4) {
            Circle().frame(width: 8, height: 8).opacity(showFirstDot ? 1 : 0.3)
            Circle().frame(width: 8, height: 8).opacity(showSecondDot ? 1 : 0.3)
            Circle().frame(width: 8, height: 8).opacity(showThirdDot ? 1 : 0.3)
        }
        .foregroundColor(.textSecondaryApp)
        .padding(12)
        .background(Color.surfaceApp)
        .cornerRadius(16)
        .onAppear { startAnimation() }
    }

    private func startAnimation() {
        let anim = Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)
        withAnimation(anim) { showFirstDot = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { withAnimation(anim) { showSecondDot = true } }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { withAnimation(anim) { showThirdDot = true } }
    }
}

#Preview {
    TypingIndicator().padding()
}
