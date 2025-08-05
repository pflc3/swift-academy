import SwiftUI

struct ProfileFooter: View {
    var body : some View {
        VStack(spacing: 8) {
            // App name
            Text("Gcode Academy")
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
            
            // App version
            Text("@ 2025 Prime Factors Learning Lab")
                .font(.caption)
                .foregroundColor(.textTertiaryApp)
        
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.bottom, 30)
        .background(Color.backgroundApp)
    }
}

#Preview {
    ProfileFooter()
}
