// Create an Account Section.
// Create Account section for the Auth screen. Contains fields and actions used during sign-up flows.
// Presentation only; relies on the Auth view model for behavior and side effects.

import SwiftUI

struct CreateAcntSection: View {
    // Form field bindings
    @Binding var name: String
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String

    // Error handling and loading state
    let errorMessage: String?
    let isLoading: Bool

    // Actions
    let signup: () -> Void
    let showLogin: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            // Header
            Text("Create Account")
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
                    iconName: "person",
                    placeholder: "Full Name",
                    isSecure: false,
                    text: $name
                )

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

                AuthTextField(
                    iconName: "lock",
                    placeholder: "Confirm Password",
                    isSecure: true,
                    text: $confirmPassword
                )
            }
            .padding(.horizontal, 16)

            /* Terms and conditions
            HStack {
                Image(systemName: "checkmark.square")
                    .foregroundColor(.white)
                
                Text("I agree to the Terms & Privacy Policy")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.top, 8) */

            // Sign up button
            AuthButton(
                title: "Create Account",
                isLoading: isLoading
            ) {
                signup()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)

            // Sign in option
            HStack {
                Text("Already have an account?")
                    .font(.caption)
                    .foregroundColor(.white)

                Button {
                    showLogin()
                } label: {
                    Text("Sign in")
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

        CreateAcntSection(
            name: .constant(""),
            email: .constant(""),
            password: .constant(""),
            confirmPassword: .constant(""),
            errorMessage: "Please fill in all fields",
            isLoading: false,
            signup: {},
            showLogin: {}
        )
    }
}
