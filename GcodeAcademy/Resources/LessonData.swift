import Foundation

// Provides access to the app's lesson content
struct LessonData {
    // Collection of all available lessons
    static let allLessons: [Lesson] = [
        binaryCommunicationLesson,
        swiftDataTypesLesson,
        arraysAndListsLesson,
        functionsLesson,
        
        // Duplicates
        binaryCommunicationLesson,
        swiftDataTypesLesson,
        arraysAndListsLesson,
        functionsLesson
    ]
    
    // Individual lesson definitions
    static let binaryCommunicationLesson = Lesson(
        title: "Binary Communication",
        shortTitle: "Binary Comm",
        description: "Learn how computers communicate using binary code and how binary digits represent information.",
        difficulty: .beginner,
        duration: 20,
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
        shortTitle: "Data Types",
        description: "Learn about Swift's fundamental data types, type safety, and how to use different types in your code.",
        difficulty: .beginner,
        duration: 25,
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
    
    static let arraysAndListsLesson = Lesson(
        title: "Arrays and Lists",
        shortTitle: "Arrays & Lists",
        description: "Master the fundamentals of organizing and storing data using arrays and lists - the building blocks of programming.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "DuDz6B4cqVc",
        slidesURL: "https://docs.google.com/presentation/d/1nH2KLMocYD4sweKbx5Je1QZc2uIHzBgU4sfm4Q6fD_9/edit?usp=sharing",
        
        // Learning objectives for this lesson
        goals: [
            Lesson.LessonGoal(description: "Understand what data structures are and why they're essential in programming"),
            Lesson.LessonGoal(description: "Learn the differences between arrays and lists"),
            Lesson.LessonGoal(description: "Master basic operations: adding, removing, and accessing elements"),
            Lesson.LessonGoal(description: "Discover when to use arrays vs lists in real applications")
        ],
        
        // Main educational content divided into sections
        contentSections: [
            Lesson.ContentSection(
                title: "What are Data Structures?",
                content: "Data structures are ways of organizing and storing data so it can be accessed and modified efficiently. Think of them as containers that hold your data in specific arrangements, like boxes on shelves or books in a library."
            ),
            Lesson.ContentSection(
                title: "Introduction to Arrays",
                content: "Arrays are collections of elements stored in contiguous memory locations. Each element can be accessed using an index (position number). Arrays have a fixed size and elements are typically of the same data type.",
                codeExample: """
                // Creating an array of integers
                let numbers = [10, 25, 30, 45, 50]
                
                // Accessing elements by index (0-based)
                let firstNumber = numbers[0]  // 10
                let thirdNumber = numbers[2]  // 30
                
                // Array length
                let arraySize = numbers.count  // 5
                """
            ),
            Lesson.ContentSection(
                title: "Common Operations",
                content: "Both arrays and lists support essential operations like searching, sorting, and iteration. Understanding these operations helps you manipulate data effectively.",
                codeExample: """
                let scores = [85, 92, 78, 96, 88]
                
                // Searching for an element
                let hasHighScore = scores.contains(96)  // true
                
                // Finding index of element
                let indexOfScore = scores.firstIndex(of: 92)  // 1
                
                // Iterating through elements
                for score in scores {
                    print("Score: \\(score)")
                }
                
                // Sorting (creates new sorted array)
                let sortedScores = scores.sorted()  // [78, 85, 88, 92, 96]
                """
            )
        ],
        
        // Practice questions to test understanding
        questions: [
            Lesson.Question(
                text: "What is the index of the first element in an array?",
                options: ["1", "0", "-1"],
                correctOptionIndex: 1  // Index 1 is "0"
            ),
            Lesson.Question(
                text: "Which data structure is better when you need to frequently add and remove elements?",
                options: ["Fixed Array", "Dynamic List", "Both are equally good"],
                correctOptionIndex: 1  // Index 1 is "Dynamic List"
            ),
            Lesson.Question(
                text: "In the array [5, 10, 15, 20], what is the value at index 2?",
                options: ["10", "15", "20"],
                correctOptionIndex: 1  // Index 1 is "15"
            )
        ],
        
        // Additional learning resources
        resources: [
            Lesson.Resource(
                title: "Visualgo: Array Visualizations",
                description: "Interactive visualizations of array operations and algorithms",
                url: "https://visualgo.net/en/array"
            ),
            Lesson.Resource(
                title: "Swift Arrays Documentation",
                description: "Official Apple documentation on Swift arrays and collections",
                url: "https://developer.apple.com/documentation/swift/array"
            )
        ]
    )
    
    static let functionsLesson = Lesson(
        title: "Functions",
        shortTitle: "Functions",
        description: "Learn to write reusable code using functions – small, organized blocks that make your programs easier to manage.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "BFh0DhBs9N4",
        slidesURL: "https://docs.google.com/presentation/d/1mK3LPxcYE5htweKbx7Je2QZc3vIHzBgU6tfm5R7gE_8/edit?usp=sharing",
        
        goals: [
            Lesson.LessonGoal(description: "Understand what functions are and why they're useful"),
            Lesson.LessonGoal(description: "Write simple functions with parameters and return values"),
        ],
        
        contentSections: [
            Lesson.ContentSection(
                title: "What are Functions?",
                content: "Functions are small chunks of code that do one job. You can run them anytime without rewriting the code. They help keep your programs clean and organized."
            ),
            Lesson.ContentSection(
                title: "Basic Function Syntax",
                content: "Use the `func` keyword to make a function. It can have inputs (parameters) and return something.",
                codeExample: """
                func sayHello() {
                    print("Hello!")
                }

                func greet(name: String) {
                    print("Hi, \\(name)!")
                }

                func add(a: Int, b: Int) -> Int {
                    return a + b
                }

                sayHello()
                greet(name: "Sam")
                let total = add(a: 2, b: 3)  // 5
                """
            ),
            Lesson.ContentSection(
                title: "Parameters and Arguments",
                content: "Parameters are inputs in a function. Arguments are the actual values you pass when calling it.",
                codeExample: """
                func area(width: Double, height: Double) -> Double {
                    return width * height
                }

                func welcome(name: String = "Guest") {
                    print("Welcome, \\(name)!")
                }

                let result = area(width: 5, height: 2)
                welcome()
                welcome(name: "Lily")
                """
            ),
            Lesson.ContentSection(
                title: "Return Values and Early Returns",
                content: "Functions can return values. You can also exit a function early using `return`.",
                codeExample: """
                func findMax(_ numbers: [Int]) -> Int? {
                    if numbers.isEmpty {
                        return nil
                    }
                    return numbers.max()
                }

                func checkAge(_ age: Int) -> String {
                    if age < 18 {
                        return "Too young"
                    }
                    return "Allowed"
                }

                let max = findMax([1, 3, 2])
                print(checkAge(20))  // Allowed
                """
            ),
        ],
        
        questions: [
            Lesson.Question(
                text: "What keyword is used to define a function in Swift?",
                options: ["function", "func", "def"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Why use small functions in your code?",
                options: ["They run faster", "They organize and reuse code", "They save battery"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What does `->` mean in a Swift function?",
                options: ["A loop", "Return type", "Function name"],
                correctOptionIndex: 1
            )
        ],
        
        resources: [
            Lesson.Resource(
                title: "Swift Functions Documentation",
                description: "Apple's official guide to functions in Swift",
                url: "https://developer.apple.com/documentation/swift/swift_standard_library/functions"
            ),
            Lesson.Resource(
                title: "Clean Code: Functions",
                description: "Tips for writing simple, readable functions",
                url: "https://www.freecodecamp.org/news/clean-coding-for-beginners/"
            )
        ]
    )
}
