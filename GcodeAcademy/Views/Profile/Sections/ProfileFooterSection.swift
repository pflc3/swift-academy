import SwiftUI

struct ProfileFooterSection: View {
    var body : some View {
        // App version
        Text("@ 2025 Prime Factors Learning Lab")
            .font(.caption)
            .foregroundColor(.textTertiaryApp)
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.bottom, 24)
        .background(Color.backgroundApp)
    }
}

#Preview {
    ProfileFooterSection()
}
