import Foundation

// Contains sample data for development and testing
struct MockData {
    // Sample user database
    static var users: [User] = [
        User(
            uid: "1",
            name: "Al Gorithm",
            email: "al@swift.academy",
            lessonsCompleted: 1,
            achievements: demoAchievements()
        ),
        User(
            uid: "2",
            name: "Alaxan Turing",
            email: "alan@swift.academy",
            bio: "CS enthusiast trying to crack Swift like I cracked codes.",
            lessonsCompleted: 4,
            achievements: demoAchievements()
        )
    ]
    
    // Locked default sample achievments
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
        /* Achievement(
            name: "Code Master",
            description: "Complete all lessons",
            icon: "trophy.fill",
            unlocked: false
        ) */
    ]
    
    // Demo achievements for mock data (first 2 unlocked)
    static func demoAchievements() -> [Achievement] {
        var achs = defaultAchievements
        achs[0].unlocked = true
        achs[1].unlocked = true
        return achs
    }
    
    // Locked defaults formatted for Firestore (array of dictionaries)
    static func defaultAchievementsFirestoreLocked() -> [[String: Any]] {
        return defaultAchievements.map { ach in
            [
                "name": ach.name,
                "description": ach.description,
                "icon": ach.icon,
                "unlocked": ach.unlocked
            ]
        }
    }
}
