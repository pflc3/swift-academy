import SwiftUI

// Enum to track current auth screen
enum AuthScreen {
    case welcome
    case signin
    case create
}

struct AuthView: View {
    // Access to the user manager
    @EnvironmentObject var userManager: UserManager
    
    // State for tracking which screen to display
    @State private var currentView: AuthScreen = .welcome
    
    // State for authentication
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var name = ""
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        /*
         * The main container for authentication screens
         */
        ZStack {
            // Animated wave background
            WaveBackground()
            
            // Content overlays
            VStack {
                // Logo at top
                HStack(alignment: .center, spacing: 16) {
                    Image("BeaverLight")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Swift")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("Academy")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 60)
                
                Spacer()
                
                // Dynamic content area
                switch currentView {
                case .welcome:
                    WelcomeSection(
                        showLogin: { withAnimation { currentView = .signin } },
                        showSignup: { withAnimation { currentView = .create } },
                        tryDemo: {
                            withAnimation {
                                userManager.login(email: "demo@swift.academy", password: "password123") { success, error in
                                    if !success {
                                        print("Demo login failed: \(error ?? "Unknown error")")
                                    }
                                }
                            }
                        }
                    )
                case .signin:
                    SignInSection(
                        email: $email,
                        password: $password,
                        errorMessage: errorMessage,
                        isLoading: isLoading,
                        login: handleLogin,
                        showSignup: { withAnimation { currentView = .create } }
                    )
                case .create:
                    CreateAcntSection(
                        name: $name,
                        email: $email,
                        password: $password,
                        confirmPassword: $confirmPassword,
                        errorMessage: errorMessage,
                        isLoading: isLoading,
                        signup: handleSignup,
                        showLogin: { withAnimation { currentView = .signin } }
                    )
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .animation(.easeInOut, value: currentView)
    }
    
    /*
     * Authentication Methods
     */

    private func handleLogin() {
        isLoading = true
        errorMessage = nil

        // Local checks
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password"
            isLoading = false
            return
        }

        // Firebase login
        userManager.login(email: email, password: password) { success, error in
            DispatchQueue.main.async {
                isLoading = false
                if success {
                    // Logged in successfully
                } else {
                    errorMessage = error ?? "Login failed"
                }
            }
        }
    }

    private func handleSignup() {
        isLoading = true
        errorMessage = nil

        // Local checks
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Please fill in all fields"
            isLoading = false
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            isLoading = false
            return
        }

        // Firebase signup
        userManager.signup(name: name, email: email, password: password, confirmPassword: confirmPassword) { success, error in
            DispatchQueue.main.async {
                isLoading = false
                if success {
                    // Signed up successfully
                } else {
                    errorMessage = error ?? "Signup failed"
                }
            }
        }
    }

}

#Preview {
    AuthView()
        .environmentObject(UserManager())
}
