import Foundation

struct MockData {
    static var users: [UserProfile] = [
        UserProfile(
            uid: "test_id_1",
            email: "al@swift.academy",
            name: "Al Gorithm",
            bio: "Swift Academy Student",
            lessonsCompleted: 1,
            achievements: demoAchievements()
        ),
        UserProfile(
            uid: "test_id_2",
            email: "alan@swift.academy",
            name: "Alaxan Turing",
            bio: "CS enthusiast trying to crack Swift like I cracked codes.",
            lessonsCompleted: 4,
            achievements: demoAchievements()
        )
    ]

    static let defaultAchievements: [Achievement] = [
        Achievement(
            name: "First Lesson",
            description: "Complete your first lesson",
            icon: "star.fill",
            unlocked: false
        ),
        Achievement(
            name: "Code Explorer",
            description: "Write your first Swift code",
            icon: "keyboard",
            unlocked: false
        ),
        Achievement(
            name: "Swift Beginner",
            description: "Complete the Swift fundamentals module",
            icon: "swift",
            unlocked: false
        ),
        Achievement(
            name: "UI Builder",
            description: "Create your first SwiftUI interface",
            icon: "rectangle.3.group",
            unlocked: false
        )
    ]

    static func demoAchievements() -> [Achievement] {
        var achs = defaultAchievements
        if !achs.isEmpty { achs[0].unlocked = true }
        if achs.count > 1 { achs[1].unlocked = true }
        return achs
    }

    static func defaultAchievementsFirestoreLocked() -> [[String: Any]] {
        defaultAchievements.map {
            [
                "name": $0.name,
                "description": $0.description,
                "icon": $0.icon,
                "unlocked": $0.unlocked
            ]
        }
    }
}
