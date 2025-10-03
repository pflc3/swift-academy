// SwiftAcademy Views - WaveBackground component.
// Animated decorative background used by the Auth screens. Contains a small Wave shape helper.
// Animation is purely visual and has no side effects; keep animation parameters local to this file.
import SwiftUI

struct WaveBackground: View {
    // Animation phase state
    @State private var phase = 0.0

    var body: some View {
        ZStack {
            // Main background
            Color.primaryApp
                .ignoresSafeArea()

            // First wave
            Wave(phase: phase, strength: 50, frequency: 10)
                .fill(Color.accentApp.opacity(0.3))
                .ignoresSafeArea()

            // Second wave
            Wave(phase: phase + 0.5, strength: 40, frequency: 8)
                .fill(Color.secondaryApp.opacity(0.2))
                .ignoresSafeArea()
        }
        .onAppear {
            // Start animation
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                phase += 2 * .pi
            }
        }
    }
}

// Wave shape generator
struct Wave: Shape {
    // Current animation phase (0 to 2π)
    var phase: Double

    // Amplitude of the wave
    var strength: Double

    // Number of waves across the width
    var frequency: Double

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()

        // Start at the bottom left
        path.move(to: CGPoint(x: 0, y: rect.height))

        // Draw to bottom right through a series of points
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midHeight = height / 2

        // Draw points along the path
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / width
            let waveHeight = sin((relativeX * frequency + phase) * 2 * .pi)
            let y = midHeight + waveHeight * strength

            path.addLine(to: CGPoint(x: x, y: y))
        }

        // Complete the path to the bottom right and back to start
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.close()

        return Path(path.cgPath)
    }
}

#Preview {
    WaveBackground()
        .frame(height: 300)
}
