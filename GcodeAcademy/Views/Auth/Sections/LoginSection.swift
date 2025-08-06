import SwiftUI

struct LoginSection: View {
    @Binding var email: String
    @Binding var password: String
    let errorMessage: String?
    let isLoading: Bool
    let login: () -> Void
    let showSignup: () -> Void
    
    var body: some View {
        Text("LoginSection Placeholder")
            .font(.title)
            .padding()
    }
}

#Preview {
    LoginSection(
        email: .constant(""),
        password: .constant(""),
        errorMessage: nil,
        isLoading: false,
        login: {},
        showSignup: {}
    )
}
