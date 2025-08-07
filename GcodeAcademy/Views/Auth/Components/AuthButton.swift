import SwiftUI

struct AuthButton: View {
    let title: String
    let action: () -> Void
    let isLoading: Bool
    let isPrimary: Bool
    
    init(title: String, isLoading: Bool = false, isPrimary: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.isLoading = isLoading
        self.isPrimary = isPrimary
        self.action = action
    }
    
    var body: some View {
        Text("AuthButton: Placeholder")
            .padding()
    }
}

#Preview {
    VStack {
        AuthButton(title: "Sample Button") {}
    }
}
