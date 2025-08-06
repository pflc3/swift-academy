import SwiftUI

// Enum to track current auth screen
enum AuthScreen {
    case welcome
    case login
    case signup
}

// The main container for authentication screens
struct AuthView: View {
    // Binding to update app-wide authentication state
    @Binding var isAuthenticated: Bool
    
    // State for tracking which screen to display
    @State private var currentView: AuthScreen = .welcome
    
    // State for authentication
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        // Auth screens
        ZStack {
            // Animated wave background
            WaveBackground()
            
            // Content overlays
            VStack {
                // Logo at top
                HStack(alignment: .center, spacing: 16) {
                    Image("Beaver")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("GCode")
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
                        showLogin: { withAnimation { currentView = .login } },
                        showSignup: { withAnimation { currentView = .signup } },
                        tryDemo: {
                            withAnimation {
                                isAuthenticated = true
                            }
                        }
                    )
                case .login:
                    LoginSection(
                        email: $email,
                        password: $password,
                        errorMessage: errorMessage,
                        isLoading: isLoading,
                        login: handleLogin,
                        showSignup: { withAnimation { currentView = .signup } }
                    )
                case .signup:
                    SignupSection(
                        name: $name,
                        email: $email,
                        password: $password,
                        errorMessage: errorMessage,
                        isLoading: isLoading,
                        signup: handleSignup,
                        showLogin: { withAnimation { currentView = .login } }
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
        
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            
            // For demo purposes, check against mock data
            if email == MockData.currentUser.email && password == MockData.currentUser.password {
                // Successfully logged in
                withAnimation {
                    isAuthenticated = true
                }
            } else if !email.isEmpty && !password.isEmpty {
                // Show credentials error
                errorMessage = "Invalid email or password"
            } else {
                // Show empty fields error
                errorMessage = "Please enter both email and password"
            }
        }
    }
    
    private func handleSignup() {
        isLoading = true
        errorMessage = nil
        
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            
            // For demo purposes, accept any non-empty fields
            if !name.isEmpty && !email.isEmpty && !password.isEmpty {
                // Successfully signed up - in a real app, you would create a new user here
                withAnimation {
                    isAuthenticated = true
                }
            } else {
                // Show error
                errorMessage = "Please fill in all fields"
            }
        }
    }
}

// Preview with binding
#Preview {
    AuthView(isAuthenticated: .constant(false))
}
