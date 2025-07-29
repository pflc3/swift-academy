import SwiftUI

struct ProfileInfoSection: View {
    var body : some View {
        VStack(spacing: 8) {
            // App name
            Text("Gcode Academy")
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
            
            // App version
            Text("Version 1.0")
                .font(.caption)
                .foregroundColor(.textTertiaryApp)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.bottom, 30)
    }
}

#Preview {
    ProfileInfoSection()
}
