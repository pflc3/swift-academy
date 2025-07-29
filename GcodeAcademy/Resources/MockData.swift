import Foundation

struct MockData {
    // Sample lessons
    static let lessons: [Lesson] = [
        Lesson(title: "Introduction to Swift", description: "Learn the basics of Swift"),
        Lesson(title: "Variables and Constants", description: "Understanding data storage")
    ]
    
    // Sample user
    static let currentUser = User(
        name: "Ada Lovelace",
        bio: "High school begginner learning IOS development with Swift",
        lessonsCompleted: 2,
        totalLessons: 7
    )
}
