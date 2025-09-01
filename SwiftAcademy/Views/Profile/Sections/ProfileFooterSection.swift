import SwiftUI

struct ProfileFooterSection: View {
    var body : some View {
        // App version
        Text("@ 2025 Prime Factors Learning Lab")
            .font(.caption)
            .foregroundColor(.textTertiaryApp)
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(Color.backgroundApp)
    }
}

#Preview {
    ProfileFooterSection()
}
