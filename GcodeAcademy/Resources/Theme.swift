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
    static let primaryApp = Color(hex: "4080BF")    // Medium blue (base color) - kept the same
    static let secondaryApp = Color(hex: "2C5282")  // Darker blue for contrast
    static let accentApp = Color(hex: "38B2AC")     // Teal that complements the blue
    
    // Background colors - clean and subtle
    static let backgroundApp = Color(hex: "F7FAFC") // Very light blue-gray
    static let cardBackgroundApp = Color.white      // White for cards
    static let surfaceApp = Color(hex: "EDF2F7")    // Light blue-gray for surfaces
    
    // Text colors - proper contrast for readability
    static let textPrimaryApp = Color(hex: "2D3748")    // Dark blue-gray for headings
    static let textSecondaryApp = Color(hex: "4A5568")  // Medium blue-gray for body
    static let textTertiaryApp = Color(hex: "718096")   // Light blue-gray for captions
    static let textOnColorApp = Color.white             // White text for colored backgrounds
    
    // Status colors - complementary to our palette
    static let successApp = Color(hex: "48BB78")    // Green
    static let errorApp = Color(hex: "F56565")      // Red
    
    // Additional UI colors
    static let dividerApp = Color(hex: "E2E8F0")     // Very light gray for dividers
    static let buttonHoverApp = Color(hex: "2B6CB0") // Slightly darker blue for hover states
}

/* Typography - Defines standard text styles for consistency */
extension Font {
    static let titleLarge = Font.system(size: 28, weight: .bold)
    static let titleMedium = Font.system(size: 22, weight: .semibold)
    static let titleSmall = Font.system(size: 20, weight: .semibold)
    
    static let bodyLarge = Font.system(size: 17)
    static let bodyMedium = Font.system(size: 15)
    static let bodySmall = Font.system(size: 13)
    
    static let caption = Font.system(size: 12, weight: .regular)
    static let caption2 = Font.system(size: 11, weight: .regular)
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
