import SwiftUI

// Displays an animated typing indicator to show that the assistant is generating a response
struct TypingIndicator: View {
    // State variable to control the animation of each dot
    @State private var showFirstDot = false
    @State private var showSecondDot = false
    @State private var showThirdDot = false
    
    var body: some View {
        HStack (spacing: 4) {
            // Three dots that will animate in sequence
            Circle()
                .frame(width: 8, height: 8)
                .opacity(showFirstDot ? 1 : 0.3)
            
            Circle()
                .frame(width: 8, height: 8)
                .opacity(showSecondDot ? 1 : 0.3)
            
            Circle()
                .frame(width: 8, height: 8)
                .opacity(showThirdDot ? 1 : 0.3)
        }
        .foregroundColor(Color.textSecondaryApp)
        .padding(12)
        .background(Color.surfaceApp)
        .cornerRadius(16)
        .onAppear {
            // Start the animation when the view appears
            startAnimation()
        }
    }
    
    // Create a wave-like animation effect across the three dots
    private func startAnimation() {
        //create a repeating animation
        let animation = Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)
        
        // Animate the first dot immediately
        withAnimation(animation) {
            showFirstDot = true
        }
        
        // Animate the second dot after a small delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(animation) {
                showSecondDot = true
            }
        }
        
        // Animate the third dot after another delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(animation) {
                showThirdDot = true
                }
            }
        }
    }
    
#Preview {
        TypingIndicator()
            .padding()
}
