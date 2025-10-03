// SwiftAcademy Core - Theme tokens.
// Centralizes app color and font tokens for consistent styling across views.
// Provides named colors and font sizes used by the UI components.
import SwiftUI

extension Color {
    static let primaryApp = Color(hex: "4080BF")
    static let secondaryApp = Color(hex: "2C5282")
    static let accentApp = Color(hex: "38B2AC")
    static let backgroundApp = Color(hex: "F7FAFC")
    static let cardBackgroundApp = Color.white
    static let surfaceApp = Color(hex: "EDF2F7")
    static let textPrimaryApp = Color(hex: "2D3748")
    static let textSecondaryApp = Color(hex: "4A5568")
    static let textTertiaryApp = Color(hex: "718096")
    static let textOnColorApp = Color.white
    static let successApp = Color(hex: "48BB78")
    static let errorApp = Color(hex: "F56565")
    static let dividerApp = Color(hex: "E2E8F0")
    static let buttonHoverApp = Color(hex: "2B6CB0")
}

extension Font {
    static let titleLarge = Font.system(size: 28, weight: .bold)
    static let titleExtraM = Font.system(size: 25, weight: .semibold)
    static let titleMedium = Font.system(size: 22, weight: .semibold)
    static let titleSmall = Font.system(size: 20, weight: .semibold)
    static let bodyLarge = Font.system(size: 17)
    static let bodyMedium = Font.system(size: 15)
    static let bodySmall = Font.system(size: 13)
    static let caption = Font.system(size: 12, weight: .regular)
    static let caption2 = Font.system(size: 11, weight: .regular)
}
