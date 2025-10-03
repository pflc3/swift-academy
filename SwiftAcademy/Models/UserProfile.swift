// SwiftAcademy Models - UserProfile.
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

    var progressPercentage: Double {
        let total = LessonData.allLessons.count
        guard total > 0 else { return 0 }
        return Double(lessonsCompleted) / Double(total)
    }

    var totalLessons: Int {
        LessonData.allLessons.count
    }
}
