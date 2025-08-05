import SwiftUI

struct MenuItem: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Icon
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .primaryApp : .textSecondaryApp)
                    .frame(width: 24)
                
                // Title
                Text(title)
                    .font(.bodyLarge)
                    .foregroundColor(isSelected ? .primaryApp : .textPrimaryApp)
                
                Spacer()
                
                // Simple selection indicator
                if isSelected {
                    Rectangle()
                        .fill(Color.primaryApp)
                        .frame(width: 3, height: 24)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(isSelected ? Color.primaryApp.opacity(0.05) : Color.clear)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack {
        MenuItem(title: "Learning Path", icon: "house", isSelected: true, action: {})
        MenuItem(title: "Chat Assistant", icon: "message", isSelected: false, action: {})
        MenuItem(title: "My Profile", icon: "person", isSelected: false, action: {})
    }
    .padding()
}
