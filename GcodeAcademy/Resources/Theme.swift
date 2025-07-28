/*
 * This file defines our app's colors and fonts in one central place.
 *
 * We use "extensions" to add new properties to existing types (Color and Font)
 * without modifying their original code.
 *
 * HOW TO USE:
 * Text("Hello")
 *     .font(.titleLarge)             // Typography from Font extension
 *     .foregroundColor(.primaryApp)  // Colors from Color extension
 */

import SwiftUI

/* Colors - Creates a consistent color palette for the entire app */
extension Color {
    // Primary colors
    static let primaryApp = Color(hex: "4080BF") // Medium blue
    static let secondaryApp = Color(hex: "50A0B0") // Teal blue
    static let accentApp = Color(hex: "A0FF80") // Light green
    
    // Background colors
    static let backgroundDarkApp = Color(hex: "1A1A1A") // Dark background
    static let backgroundLightApp = Color.white // White
    
    // Text colors
    static let textPrimaryApp = Color.white // White
    static let textSecondaryApp = Color(hex: "50A0E0") // Blue text
    static let textTertiaryApp = Color(hex: "A0A0A0") // Light gray
}

/* Typography - Defines standard text styles for consistency */
extension Font {
    static let titleLarge = Font.system(size: 28, weight: .bold)
    static let titleMedium = Font.system(size: 22, weight: .semibold)
    static let titleSmall = Font.system(size: 20, weight: .semibold)
    
    static let bodyLarge = Font.system(size: 17)
    static let bodyMedium = Font.system(size: 15)
    static let bodySmall = Font.system(size: 13)
    
    static let caption = Font.system(size: 12, weight: .light)
}

/*
 * Helper to create colors from hex codes (like #FF5500)
 *
 * This extension adds a new way to create colors using hex strings,
 * which is how designers often specify colors.
 */
extension Color {
    init(hex: String) {
        // Clean the string and convert to a number
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        // Extract the red, green, blue components
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // Short hex format (like #F80)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // Standard hex format (like #FF8800)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // Hex with alpha (like #FFFF8800)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }

        // Create the color with these components
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
