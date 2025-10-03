// Profile header section.
// Displays the user's avatar initials, name, bio, and an edit button.

import SwiftUI

struct ProfileHeaderSection: View {
    let user: UserProfile
    @Binding var showingEditProfile: Bool

    var body: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .topTrailing) {
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

                Button(
                    action: { showingEditProfile = true },
                    label: {
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
                )
                .padding(.top, 18)
            }

            Text(user.name)
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)

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
    ProfileHeaderSection(user: MockData.users[0], showingEditProfile: .constant(false))
}
