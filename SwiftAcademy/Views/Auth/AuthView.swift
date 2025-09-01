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
                                // Auto-login with first mock user
                                _ = userManager.login(email: "al@swift.academy", password: "sorting")
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
        
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            
            // Check for empty fields
            if !email.isEmpty && !password.isEmpty {
                if userManager.login(email: email, password: password) {
                    // Successfully logged in
                } else {
                    // Credentials error
                    errorMessage = "Invalid email or password"
                }
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
            
            // Check for empty fields
            if !name.isEmpty && !email.isEmpty && !password.isEmpty && confirmPassword == password {
               if userManager.signup(name: name, email: email, password: password, confirmPassword: confirmPassword) {
                    // Successfully signed up
                } else {
                    // Email already exists
                    errorMessage = "This email is already registered"
                }
            } else if name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
                // Empty error
                errorMessage = "Please fill in all fields"
            } else if confirmPassword != password {
                // Password error
                errorMessage = "Please make sure passwords match"
            }
        }
    }
}

#Preview {
    AuthView()
        .environmentObject(UserManager())
}
