import SwiftUI

struct SignupSection: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var password: String
    let errorMessage: String?
    let isLoading: Bool
    let signup: () -> Void
    let showLogin: () -> Void
    
    var body: some View {
        Text("SignupSection Placeholder")
            .font(.title)
            .padding()
    }
}

#Preview {
    SignupSection(
        name: .constant(""),
        email: .constant(""),
        password: .constant(""),
        errorMessage: nil,
        isLoading: false,
        signup: {},
        showLogin: {}
    )
}
