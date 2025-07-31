import Foundation

struct MockData {
    // Sample detailed lesson on binary communication
    static let binaryCommunicationLesson = Lesson(
        title: "Understanding Binary Communication",
        description: "Learn how computers communicate using binary code and how binary digits represent information.",
        difficulty: "Beginner",
        duration: "25 minutes",
        videoID: "zDNaUi2cjv4",  // YouTube video ID for an educational video about binary
        
        // Learning objectives for this lesson
        goals: [
            Lesson.LessonGoal(description: "Understand what binary code is and why computers use it"),
            Lesson.LessonGoal(description: "Learn how to convert between binary and decimal numbers"),
            Lesson.LessonGoal(description: "Discover how text is encoded using binary")
        ],
        
        // Main educational content divided into sections (some with or without code examples)
        contentSections: [
            Lesson.ContentSection(
                title: "What is Binary?",
                content: "Binary is a number system that uses only two digits: 0 and 1. Computers use binary because electronic components can easily represent two states: on/off or high/low voltage."
            ),
            Lesson.ContentSection(
                title: "Binary to Decimal Conversion",
                content: "Each position in a binary number represents a power of 2. To convert binary to decimal, multiply each digit by its position value and sum the results.",
                codeExample: """
                // Binary: 1 0 1 1
                // = 1×8 + 0×4 + 1×2 + 1×1
                // = 8 + 0 + 2 + 1 = 11
                """
            ),
            Lesson.ContentSection(
                title: "Text Representation",
                content: "Computers store text as numbers using encoding standards like ASCII. Each character is assigned a numeric value that's stored in binary.",
                codeExample: """
                // ASCII examples:
                // 'A' = 65 = 01000001
                // 'B' = 66 = 01000010
                """
            )
        ],
        
        // Practice questions to test understanding
        questions: [
            Lesson.Question(
                text: "What number system do computers use internally?",
                options: ["Decimal (Base 10)", "Binary (Base 2)", "Hexadecimal (Base 16)"],
                correctOptionIndex: 1  // Index 1 is "Binary"
            ),
            Lesson.Question(
                text: "What is the decimal value of binary 1010?",
                options: ["5", "15", "10"],
                correctOptionIndex: 2  // Index 2 is "10"
            ),
            Lesson.Question(
                text: "What is the decimal value of binary 1010?",
                options: ["5", "15", "10"],
                correctOptionIndex: 2  // Index 2 is "10"
            ),
        ],
        
        // Additional learning resources
        resources: [
            Lesson.Resource(
                title: "Khan Academy: Binary Numbers",
                description: "Interactive lessons on binary number systems",
                url: "https://www.khanacademy.org/computing/computer-science/how-computers-work2/v/khan-academy-and-codeorg-binary-data"
            ),
            Lesson.Resource(
                title: "ASCII Table Reference",
                description: "Complete reference of ASCII character codes",
                url: "https://www.asciitable.com/"
            )
        ]
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
            name: "Swift Beginner",
            description: "Complete the Swift fundamentals module",
            icon: "swift",
            unlocked: true
        ),
        Achievement(
            name: "UI Builder",  // Fixed typo in name
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
        bio: "High school beginner learning iOS development with Swift",  // Fixed spelling of "beginner"
        lessonsCompleted: 2,
        totalLessons: 4,
        achievements: achievements
    )
}
