import Foundation

// Contains sample data for development and testing
struct MockData {
    // Sample user
    static let currentUser = User(
        name: "Ada Lovelace",
        email: "ada@gcode.academy",
        password: "password123",
        bio: "High school beginner learning iOS development with Swift",
        lessonsCompleted: 5,
        totalLessons: LessonData.allLessons.count,
        achievements: achievements
    )
    
    // Sample achievements
    static let achievements: [Achievement] = [
        Achievement(
            name: "First Lesson",
            description: "Complete your first lesson",
            icon: "star.fill",
            unlocked: true
        ),
        Achievement(
            name: "Code Explorer",
            description: "Write your first Swift code",
            icon: "keyboard",
            unlocked: true
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
}
