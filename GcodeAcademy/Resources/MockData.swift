import Foundation

struct MockData {
    // Sample lessons
    static let lessons: [Lesson] = [
        Lesson(title: "Introduction to Swift", description: "Learn the basics of Swift"),
        Lesson(title: "Variables and Constants", description: "Understanding data storage")
    ]
    
    // Sample achievements
    static let achievements: [Achievement] = [
        Achievemnt(
            name: "First Lesson",
            description: "Complete your first lesson",
            icon: "star.fill",
            unlocked: true
        ),
        Achievement(
            name: "Swift Beginner",
            description: "Complete the Swift fundamentals module",
            icon: "swift",
            unlocked: true
        ),
        Achievement(
            name: "UI BUilder",
            description: "Create your first SwiftUI interface",
            icon: "rectangle.3.group",
            unlocked: false
        ),
        Achievement(
            name: "Code Master",
            description: "Complete all lessons",
            icon: "trophy.fill",
            unlocked: false
        )
    ]
    
    // Sample user
    static let currentUser = User(
        name: "Ada Lovelace",
        bio: "High school begginner learning IOS development with Swift",
        lessonsCompleted: 2,
        totalLessons: 4,
        achievements: achievements
    )
}
