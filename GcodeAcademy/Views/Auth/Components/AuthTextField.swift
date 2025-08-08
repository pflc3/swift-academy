import SwiftUI

struct AuthTextField: View {
    // System icon name to display
    let iconName: String
    // Placeholder text for the field
    let placeholder: String
    // Whether to use secure text entry (for passwords)
    let isSecure: Bool
    // Binding to the text value
    @Binding var text: String
    
    var body: some View {
        HStack {
            // Icon
            Image(systemName: iconName)
                .foregroundColor(.primaryApp)
                .frame(width: 24)
            
            // Text field
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                        .autocapitalization(.none)
                }
            }
            .foregroundColor(.textPrimaryApp)
            .font(.bodyLarge)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
    }
}

#Preview {
    VStack {
        AuthTextField(
            iconName: "envelope",
            placeholder: "Email",
            isSecure: false,
            text: .constant("user@example.com")
        )
        
        AuthTextField(
            iconName: "lock",
            placeholder: "Password",
            isSecure: true,
            text: .constant("password123")
        )
    }
    .padding()
    .background(Color.backgroundApp)
}
