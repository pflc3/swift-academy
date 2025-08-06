import SwiftUI

struct WelcomeSection: View {
    let showLogin: () -> Void
    let showSignup: () -> Void
    let tryDemo: () -> Void
    
    var body: some View {
        Text("WelcomeSection Placeholder")
            .font(.title)
            .padding()
    }
}

#Preview {
    WelcomeSection(showLogin: {}, showSignup: {}, tryDemo: {})
}
