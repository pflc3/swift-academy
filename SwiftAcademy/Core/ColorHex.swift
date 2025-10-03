// ColorHex utility.
// Provides a convenience initializer for `Color` from hex strings used in theme.
// Handles 3/6/8 digit hex and a small fallback for invalid values.

import SwiftUI

extension Color {
    init(hex hexString: String) {
        let sanitized = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var hexInt: UInt64 = 0
        Scanner(string: sanitized).scanHexInt64(&hexInt)

        let alpha, red, green, blue: UInt64
        switch sanitized.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (
                255,
                (hexInt >> 8) * 17,
                (hexInt >> 4 & 0xF) * 17,
                (hexInt & 0xF) * 17
            )
        case 6: // RRGGBB (24-bit)
            (alpha, red, green, blue) = (
                255,
                hexInt >> 16,
                hexInt >> 8 & 0xFF,
                hexInt & 0xFF
            )
        case 8: // AARRGGBB (32-bit)
            (alpha, red, green, blue) = (
                hexInt >> 24,
                hexInt >> 16 & 0xFF,
                hexInt >> 8 & 0xFF,
                hexInt & 0xFF
            )
        default: // Fallback: yellow to make mistakes visible
            (alpha, red, green, blue) = (255, 255, 255, 0)
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }
}
