import Foundation

struct MockData {
    // Sample detailed lesson on binary communication
    static let binaryCommunicationLesson = Lesson(
        title: "Binary Communication",
        description: "Learn how computers communicate using binary code and how binary digits represent information.",
        difficulty: "Beginner",
        duration: "25 minutes",
        videoID: "k68-cStI1ok",
        slidesURL: "https://docs.google.com/presentation/d/1mGTJNUocYB3rweKax4Id0PYb1tHGyAgT3rel3P5eB_8/edit?usp=sharing",
        
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
    
    static let swiftDataTypesLesson = Lesson(
        title: "Swift Data Types",
        description: "Learn about Swift's fundamental data types, type safety, and how to use different types in your code.",
        difficulty: "Beginner",
        duration: "15 minutes",
        videoID: "YjSfJTXaqTI",
        slidesURL: "https://docs.google.com/presentation/d/15-sR9-beHDIPxEvpBoW5LjQ-I3YMHClzUgsMFmTeBp4/edit?usp=sharing",
        
        // Learning objectives for this lesson
        goals: [
            Lesson.LessonGoal(description: "Understand Swift's basic data types (String, Int, Double, Bool)"),
            Lesson.LessonGoal(description: "Learn about type safety and type inference"),
            Lesson.LessonGoal(description: "Practice using and converting between different data types")
        ],
        
        // Main educational content divided into sections with code examples
        contentSections: [
            Lesson.ContentSection(
                title: "Basic Data Types",
                content: "Swift has several fundamental data types that represent different kinds of values. The most common ones are String (text), Int (whole numbers), Double (decimal numbers), and Bool (true/false values).",
                codeExample: """
                // String - for text values
                let name: String = "Ada Lovelace"
                
                // Int - for whole numbers
                let age: Int = 16
                
                // Double - for decimal numbers
                let height: Double = 5.6
                
                // Bool - for true/false values
                let isStudent: Bool = true
                """
            ),
            Lesson.ContentSection(
                title: "Type Safety and Type Inference",
                content: "Swift is a type-safe language, which means it helps you be clear about the types of values your code can work with. Swift can also infer the type of a variable from its initial value, so you don't always need to specify it.",
                codeExample: """
                // Type inference - Swift figures out the type
                let name = "Ada"     // Swift knows this is a String
                let age = 16         // Swift knows this is an Int
                let height = 5.6     // Swift knows this is a Double
                
                // Type safety - this would cause an error
                // let sum = name + age  // Can't add String and Int!
                """
            )
        ],
        
        // Pract-ice questions to test understanding
        questions: [
            Lesson.Question(
                text: "Which data type would you use to store someone's name?",
                options: ["Int", "String", "Bool"],
                correctOptionIndex: 1  // Index 1 is "String"
            ),
            Lesson.Question(
                text: "What will Swift infer the type of 'let score = 42' to be?",
                options: ["String", "Double", "Int"],
                correctOptionIndex: 2  // Index 2 is "Int"
            ),
            Lesson.Question(
                text: "What happens when you convert a Double to an Int in Swift?",
                options: ["It rounds to the nearest whole number", "It truncates the decimal portion", "It causes a compile error"],
                correctOptionIndex: 1  // Index 1 is "It truncates the decimal portion"
            ),
        ],
        
        // Additional learning resources
        resources: [
            Lesson.Resource(
                title: "Swift.org: The Basics",
                description: "Official Swift documentation on basic data types",
                url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/"
            ),
            Lesson.Resource(
                title: "Apple Developer: Basic Data Types",
                description: "Learn more about Swift's fundamental types",
                url: "https://developer.apple.com/documentation/swift/string"
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
    
    // Sample user
    static let currentUser = User(
        name: "Ada Lovelace",
        bio: "High school beginner learning iOS development with Swift",
        lessonsCompleted: 2,
        totalLessons: 8,
        achievements: achievements
    )
}
