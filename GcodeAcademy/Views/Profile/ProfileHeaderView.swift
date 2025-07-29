import SwiftUI

// Displays the user's avatar, name, and bio
struct ProfileHeaderView: View {
    // The user model to display
    let user: User
    
    var body: some View {
        VStack(spacing:16) {
            // Avatar circle with user initials
            ZStack {
                Circle()
                    .fill(Color.cardBackgroundApp)
                    .frame(width:100, height: 110)
                    .shadow(color: Color.black.opacity(0.08), radius: 4, x:0, y:2)
                Text(user.initials)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.primaryApp)
            }
            .padding(.top, 20)
            
            // User's full name
            Text(user.name)
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)
            
            //User's biography/description
            Text(user.bio)
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity)
        .background(Color.cardBackgroundApp)
    }
}

#Preview {
    ProfileHeaderView(user: MockData.currentUser)
}
