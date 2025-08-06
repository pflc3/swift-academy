import SwiftUI

struct AuthTextField: View {
    let iconName: String
    let placeholder: String
    let isSecure: Bool
    @Binding var text: String
    
    var body: some View {
        Text("AuthTextField Placeholder")
            .font(.headline)
            .padding(.bottom, 4)
    }
}

#Preview {
    AuthTextField(
        iconName: "envelope",
        placeholder: "Email",
        isSecure: false,
        text: .constant("")
    )
}
