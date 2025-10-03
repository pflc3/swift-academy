// SwiftAcademy Views - CustomNavBar.
// Top navigation bar used across main screens with a menu button and centered title.
import SwiftUI

struct CustomNavBar: View {
    let title: String
    @Binding var showMenu: Bool

    var body: some View {
        HStack {
            // Menu Button
            Button(
                action: {
                    withAnimation(.spring()) { showMenu.toggle() }
                },
                label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.titleMedium)
                        .foregroundColor(.primaryApp)
                        .padding(.leading, 16)
                }
            )

            Spacer()

            // Title
            Text(title)
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)

            Spacer()

            // Empty space to balance the hamburger button
            Image(systemName: "line.horizontal.3")
                .font(.titleMedium)
                .foregroundColor(.clear)
                .padding(.trailing, 16)
        }
        .frame(height: 60)
        .background(Color.cardBackgroundApp)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    CustomNavBar(title: "Learning Path", showMenu: .constant(false))
}
