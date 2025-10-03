// TopBar component.
// Reusable top navigation bar for detail screens providing back navigation and title.
// Designed for consistent header appearance across lesson screens.

import SwiftUI

struct TopBar: View {
    @Environment(\.dismiss) private var dismiss
    let title: String

    var body: some View {
        HStack {
            // Back button
            Button(
                action: { dismiss() },
                label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16.5, weight: .semibold))
                        Text("Back")
                            .font(.system(size: 17.5))
                    }
                }
            )
            .padding(.vertical, 8)
            .padding(.leading, 16)
            .foregroundColor(.primaryApp)

            Spacer()

            // Centered title
            Text(title)
                .font(.system(size: 19, weight: .semibold))
                .lineLimit(1)
                .foregroundColor(.textPrimaryApp)

            Spacer()

            // Empty view for symmetry (same width as back button)
            HStack(spacing: 4) {
                Text("ckaB")
                    .font(.system(size: 17.5))
                Image(systemName: "chevron.right")
                    .font(.system(size: 16.5, weight: .semibold))
            }
            .padding(.vertical, 8)
            .padding(.trailing, 16)
            .opacity(0)
        }
        .padding(.top, 12)
        .padding(.bottom, 8)
        .background(Color.cardBackgroundApp)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    TopBar(title: "ABCD EFG HIJK LMNOP")
}
