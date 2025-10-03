// SwiftAcademy Views - ToastBanner.
// Small overlay used to display brief success/error messages to the user.
import SwiftUI

struct ToastBanner: View {
    let toast: ToastCenter.ToastMessage

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: toast.isPositive ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                .foregroundColor(toast.isPositive ? .successApp : .errorApp)
                .font(.title2)

            Text(toast.message)
                .font(.bodyLarge)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(3)

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(toast.isPositive
                        ? Color.successApp.opacity(0.35)
                        : Color.errorApp.opacity(0.55), lineWidth: 0.5
                )
        )
        .allowsHitTesting(false)
        .transition(.asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity),
            removal: .move(edge: .bottom).combined(with: .opacity)
        ))
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: toast.message)
    }
}

#Preview("Positive") {
    ZStack {
        Color.backgroundApp.ignoresSafeArea()
        ToastBanner(toast: ToastCenter.ToastMessage(message: "Profile updated", isPositive: true))
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview("Negative") {
    ZStack {
        Color.backgroundApp.ignoresSafeArea()
        ToastBanner(toast: ToastCenter.ToastMessage(message: "Failed to save profile", isPositive: false))
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}
