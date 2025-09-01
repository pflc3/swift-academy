import SwiftUI

struct AuthButton: View {
    // The text displayed on the button
    let title: String
    // The action to perform when the button is tapped
    let action: () -> Void
    // Whether the button is in a loading state
    let isLoading: Bool
    // Whether to use primary (true) or secondary (false) styling
    let isPrimary: Bool
    
    init(title: String, isLoading: Bool = false, isPrimary: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.isLoading = isLoading
        self.isPrimary = isPrimary
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
        }) {
            ZStack {
                // Button background
                RoundedRectangle(cornerRadius: 12)
                    .fill(isPrimary ? Color.primaryApp : Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                // Content
                if isLoading {
                    // Loading spinner
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: isPrimary ? .white : .primaryApp))
                        .scaleEffect(1.5)
                } else {
                    // Button text
                    Text(title)
                        .font(.headline)
                        .foregroundColor(isPrimary ? .white : .primaryApp)
                }
            }
        }
        .frame(height: 56)
        .disabled(isLoading)
    }
}

#Preview {
    VStack(spacing: 20) {
        AuthButton(title: "Sign In", isLoading: false) {}
        
        AuthButton(title: "Create Account", isPrimary: false) {}
        
        AuthButton(title: "Loading...", isLoading: true) {}
    }
    .padding()
    .background(Color.backgroundApp)
}
