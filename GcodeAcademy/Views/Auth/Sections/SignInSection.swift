import SwiftUI

struct SignInSection: View {
    // Form field bindings
    @Binding var email: String
    @Binding var password: String
    
    // Error handling and loading state
    let errorMessage: String?
    let isLoading: Bool
    
    // Actions
    let login: () -> Void
    let showSignup: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            // Header
            Text("Sign In")
                .font(.titleLarge)
                .foregroundColor(.white)
                .padding(.bottom, 16)
            
            // Error message if any
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.errorApp.opacity(0.8))
                    .cornerRadius(8)
            }
            
            // Form fields
            VStack(spacing: 16) {
                AuthTextField(
                    iconName: "envelope",
                    placeholder: "Email",
                    isSecure: false,
                    text: $email
                )
                
                AuthTextField(
                    iconName: "lock",
                    placeholder: "Password",
                    isSecure: true,
                    text: $password
                )
            }
            .padding(.horizontal, 16)
            
            /* Forgot password link
            Button {
                // Implement forgot password
            } label: {
                Text("Forgot Password?")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.top, 8)
            } */
            
            // Sign in button
            AuthButton(
                title: "Sign In",
                isLoading: isLoading
            ) {
                login()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            // Sign up option
            HStack {
                Text("Don't have an account?")
                    .font(.caption)
                    .foregroundColor(.white)
                
                Button {
                    showSignup()
                } label: {
                    Text("Create one")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 16)
        }
        .padding(.bottom, 60)
    }
}

#Preview {
    ZStack {
        Color.primaryApp.ignoresSafeArea()
        
        SignInSection(
            email: .constant(""),
            password: .constant(""),
            errorMessage: nil,
            isLoading: false,
            login: {},
            showSignup: {}
        )
    }
}
