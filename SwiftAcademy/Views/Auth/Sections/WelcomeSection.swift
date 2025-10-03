// SwiftAcademy Views - Welcome section.
// Introductory content shown at the top of the Auth screen (title, subtitle, brief copy).
// Purely presentational; keep copy and layout here, avoid embedding business logic.
import SwiftUI

struct WelcomeSection: View {
    // Navigation actions
    let showLogin: () -> Void
    let showSignup: () -> Void
    let tryDemo: () -> Void

    var body: some View {
        VStack(spacing: 30) {
            // Welcome message
            VStack(spacing: 16) {
                Text("Welcome")
                    .font(.system(size: 38, weight: .bold))
                    .foregroundColor(.white)

                Text("Your journey to becoming a Swift developer starts here")
                    .font(.bodyLarge)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 8)
            }
            .padding(.bottom, 40)

            // Action buttons
            VStack(spacing: 16) {
                AuthButton(title: "Create Account", isPrimary: false) {
                    showSignup()
                }

                AuthButton(title: "Sign In") {
                    showLogin()
                }

                // Skip option for demo purposes
                Button(action: tryDemo) {
                    Text("Try a Demo")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.top, 12)
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.bottom, 60)
    }
}

#Preview {
    ZStack {
        Color.primaryApp.ignoresSafeArea()

        WelcomeSection(
            showLogin: {},
            showSignup: {},
            tryDemo: {}
        )
    }
}
