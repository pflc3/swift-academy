import SwiftUI

// Displays the user's avatar, name, and bio
struct ProfileHeaderSection: View {
    // The user model to display
    @EnvironmentObject var user: User
    // Binding to control edit profile sheet
    @Binding var showingEditProfile: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            // Container for the avatar + edit button
            ZStack(alignment: .topTrailing) {
                // Avatar circle with user initials
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.cardBackgroundApp)
                            .frame(width: 100, height: 110)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        Text(user.initials)
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(.primaryApp)
                    }
                    .padding(.top, 20)
                }
                
                // Edit button
                Button(action: { showingEditProfile = true }) {
                    Image(systemName: "pencil")
                        .font(.system(size: 14))
                        .foregroundColor(.primaryApp)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(Color.surfaceApp)
                                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                                .overlay(
                                    Circle()
                                        .stroke(Color.primaryApp.opacity(0.2), lineWidth: 1)
                                )
                        )
                }
                .padding(.top, 18)
                .padding(.trailing, 0)
            }
            
            // User's full name
            Text(user.name)
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)
            
            // User's biography/description
            Text(user.bio)
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity)
        .background(Color.backgroundApp)
    }
}

#Preview {
    ProfileHeaderSection(showingEditProfile: .constant(false)).environmentObject(CurrentUser.user)
}
