import SwiftUI

struct MenuItem: View {
    let title: String
    let icon: String
    let selectedIcon: String? // Optional selected state icon
    let isSelected: Bool
    let action: () -> Void
    let isCustomIcon: Bool // Flag to determine if it's a custom icon

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Icon handling
                if isCustomIcon {
                    // Preload both images
                    ZStack {
                        // Normal icon always present but hidden when selected
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .opacity(isSelected && selectedIcon != nil ? 0 : 1)

                        // Selected icon always present but hidden when not selected
                        if let selectedIcon = selectedIcon {
                            Image(selectedIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .opacity(isSelected ? 1 : 0)
                        }
                    }
                    .frame(width: 28)
                } else {
                    // Default system icon behavior
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(isSelected ? Color.primaryApp : Color.textSecondaryApp)
                        .frame(width: 28)
                }

                // Title
                Text(title)
                    .font(.system(size: 18.5))
                    .foregroundColor(isSelected ? Color.primaryApp : Color.textPrimaryApp)

                Spacer()

                // Simple selection indicator
                if isSelected {
                    Rectangle()
                        .fill(Color.primaryApp)
                        .frame(width: 3, height: 28)
                }
            }
            // Make the entire row tappable by expanding the hit area.
            // This includes the icon, text, and the surrounding spacing.
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(isSelected ? Color.primaryApp.opacity(0.05) : Color.clear)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack {
        MenuItem(
            title: "Swift Journey",
            icon: "house",
            selectedIcon: nil,
            isSelected: true,
            action: {},
            isCustomIcon: false
        )

        MenuItem(
            title: "Code Coach",
            icon: "code-coach-normal",
            selectedIcon: "code-coach-selected",
            isSelected: false,
            action: { },
            isCustomIcon: true
        )

        MenuItem(
            title: "My Profile",
            icon: "person",
            selectedIcon: nil,
            isSelected: false,
            action: { },
            isCustomIcon: false
        )
    }
}
