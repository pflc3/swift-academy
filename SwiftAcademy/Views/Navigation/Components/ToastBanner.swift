import SwiftUI

struct ToastBanner: View {
    let toast: ToastCenter.ToastMessage
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 10) {
                Image(systemName: toast.isPositive ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                    .foregroundColor(toast.isPositive ? .green : .orange)
                    .font(.title3)
                
                Text(toast.message)
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(toast.isPositive ? Color.green.opacity(0.3) : Color.orange.opacity(0.3), lineWidth: 1)
            )
        }
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: toast.message)
        .allowsHitTesting(false)
    }
}

#Preview("Positive") {
    ZStack {
        Color.backgroundApp.ignoresSafeArea()
        ToastBanner(toast: ToastCenter.ToastMessage(message: "Profile updated", isPositive: true))
            .padding(.horizontal, 16)
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview("Negative") {
    ZStack {
        Color.backgroundApp.ignoresSafeArea()
        ToastBanner(toast: ToastCenter.ToastMessage(message: "Failed to save profile", isPositive: false))
            .padding(.horizontal, 16)
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}
