// Achievement.
// Simple value model representing an achievement earned by a user.
// Used in profile views and achievement lists throughout the app.

import Foundation

struct Achievement: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var icon: String
    var unlocked: Bool = false
}
