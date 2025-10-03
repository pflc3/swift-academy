// UserProfile.
// Represents authenticated user information and simple UI-derived properties.
// Includes progress and computed initials used in profile and navigation UI.

import Foundation

struct UserProfile: Identifiable, Equatable {
    var uid: String
    var email: String
    var name: String
    var bio: String
    var lessonsCompleted: Int
    var achievements: [Achievement]
    var id: String { uid }

    /// Returns user initials for avatar display. Falls back to "?" when name is empty.
    var initials: String {
        let parts = name.split(separator: " ")
        if let first = parts.first?.first {
            if parts.count >= 2, let last = parts.dropFirst().first?.first {
                return String([first, last])
            }
            return String(first)
        }
        return "?"
    }

    /// Fraction of lessons completed based on `LessonData.allLessons` (0..1).
    var progressPercentage: Double {
        let total = LessonData.allLessons.count
        guard total > 0 else { return 0 }
        return Double(lessonsCompleted) / Double(total)
    }

    /// Convenience accessor for total lessons available in the app data set.
    var totalLessons: Int {
        LessonData.allLessons.count
    }
}
