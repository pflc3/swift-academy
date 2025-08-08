import Foundation

// Contains sample data for development and testing
struct MockData {
    // Sample user database
    static var users: [User] = [
        User(
            name: "Ada Lovelace",
            email: "ada@gcode.academy",
            password: "password123",
            bio: "High school student learning iOS development with Swift",
            lessonsCompleted: 2,
            achievements: achievements
        ),
        User(
            name: "Alan Turing",
            email: "alan@gcode.academy",
            password: "enigma",
            bio: "Computer science enthusiast and puzzle solver",
            lessonsCompleted: 4,
            achievements: achievements
        )
    ]
    
    // Sample achievements - used for all users for now
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
