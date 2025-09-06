import Foundation

struct LessonData {
    static let allLessons: [Lesson] = [
        binaryLesson,
        dataTypesLesson,
        arraysListsLesson,
        functionsLesson,
        dictionariesLesson,
        SwiftUIBasicsLesson,

        controlFlowLesson,
        optionalsLesson,
        closuresLesson,
        protocolsLesson,

        xcodeIntroLesson,

        dataHandlingLesson,
        stateLesson,
        navigationLesson,
        swiftUIListsLesson,
        formsLesson,
        environmentLesson,
        gesturesLesson,
        animationsLesson,
        alertsLesson,
        customViewsLesson,
        listAndForEachLesson,
        stateObjectLesson,

        asyncAwaitLesson,
        errorHandlingLesson,

        projectSetupLesson,
        mainUILayoutLesson,
        stateManagementLesson,
        userInputLesson,
        listUILesson,
        addTasksLesson,
        editTasksLesson,
        deleteTasksLesson,
        swipeToDeleteLesson,
        userSettingsLesson,
        persistenceLesson,
        jsonCrudLesson,
        coreDataLesson,
        swiftDataLesson,
        firebaseLesson,
        publishLesson,
        whatsNextLesson
    ]

    static let binaryLesson = Lesson(
        title: "Binary Communication",
        shortTitle: "Binary Comm",
        description: "Learn how computers communicate using binary code and how binary digits represent information.",
        difficulty: .beginner,
        duration: 20,
        videoID: "k68-cStI1ok",
        slidesURL: "https://docs.google.com/presentation/d/1mGTJNUocYB3rweKax4Id0PYb1tHGyAgT3rel3P5eB_8/edit?usp=sharing",
        slideThumbnails: ["binary1", "binary2", "binary3"],

        goals: [
            Lesson.LessonGoal(description: "Understand what binary code is and why computers use it"),
            Lesson.LessonGoal(description: "Learn how to convert between binary and decimal numbers"),
            Lesson.LessonGoal(description: "Discover how text is encoded using binary")
        ],

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

        questions: [
            Lesson.Question(
                text: "What number system do computers use internally?",
                options: ["Decimal (Base 10)", "Binary (Base 2)", "Hexadecimal (Base 16)"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What is the decimal value of binary 1010?",
                options: ["5", "15", "10"],
                correctOptionIndex: 2
            ),
            Lesson.Question(
                text: "What is the decimal value of binary 1010?",
                options: ["5", "15", "10"],
                correctOptionIndex: 2
            )
        ],

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

    static let dataTypesLesson = Lesson(
        title: "Swift Data Types",
        shortTitle: "Data Types",
        description: "Learn about Swift's fundamental data types, type safety, and how to use different types in your code.",
        difficulty: .beginner,
        duration: 25,
        videoID: "YjSfJTXaqTI",
        slidesURL: "https://docs.google.com/presentation/d/15-sR9-beHDIPxEvpBoW5LjQ-I3YMHClzUgsMFmTeBp4/edit?usp=sharing",
        slideThumbnails: ["datatypes1", "datatypes2", "datatypes3"],

        goals: [
            Lesson.LessonGoal(description: "Understand Swift's basic data types (String, Int, Double, Bool)"),
            Lesson.LessonGoal(description: "Learn about type safety and type inference"),
            Lesson.LessonGoal(description: "Practice using and converting between different data types")
        ],

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

        questions: [
            Lesson.Question(
                text: "Which data type would you use to store someone's name?",
                options: ["Int", "String", "Bool"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What will Swift infer the type of 'let score = 42' to be?",
                options: ["String", "Double", "Int"],
                correctOptionIndex: 2
            ),
            Lesson.Question(
                text: "What happens when you convert a Double to an Int in Swift?",
                options: ["It rounds to the nearest whole number", "It truncates the decimal portion", "It causes a compile error"],
                correctOptionIndex: 1
            )
        ],

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

    static let arraysListsLesson = Lesson(
        title: "Arrays and Lists",
        shortTitle: "Arrays & Lists",
        description: "Master the fundamentals of organizing and storing data using arrays and lists - the building blocks of programming.",
        difficulty: .beginner,
        duration: 30,
        videoID: "DuDz6B4cqVc",
        slidesURL: "https://docs.google.com/presentation/d/1GakhlxRNLV3AAw5uXXZSghMN1pZ3PQaVylLOCqRHtK8/edit?usp=sharing",
        slideThumbnails: ["arrays1", "arrays2", "arrays3"],

        goals: [
            Lesson.LessonGoal(description: "Understand what data structures are and why they're essential in programming"),
            Lesson.LessonGoal(description: "Learn the differences between arrays and lists"),
            Lesson.LessonGoal(description: "Master basic operations: adding, removing, and accessing elements")
        ],

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
        difficulty: .beginner,
        duration: 30,
        videoID: "fffG55Ei1Qc",
        slidesURL: "https://docs.google.com/presentation/d/193FcPGqmMt6zAtX3m3Yb6YlFW8ins6hzTCjbxUqnxhE/edit?usp=sharing",
        slideThumbnails: ["functions1", "functions2", "functions3"],

        goals: [
            Lesson.LessonGoal(description: "Understand what functions are and why they're useful"),
            Lesson.LessonGoal(description: "Write simple functions with parameters and return values")
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
            )
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

    static let dictionariesLesson = Lesson(
        title: "Dictionaries",
        shortTitle: "Dictionaries",
        description: "Discover how to organize and access data efficiently using dictionaries, key-value pairs, and other fundamental data structures.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "iM2lMBAckKg",
        slidesURL: "https://docs.google.com/presentation/d/14f5fMvwcECWb20oxvrpuC-H3GprAKv8QbCdl3mpLa-o/edit?slide=id.p#slide=id.p",
        slideThumbnails: ["dict1", "dict2", "dict3"],

        goals: [
            Lesson.LessonGoal(description: "Understand what dictionaries are and when to use them"),
            Lesson.LessonGoal(description: "Learn to create, access, and modify dictionary data"),
            Lesson.LessonGoal(description: "Explore nested data structures and real-world applications")
        ],

        contentSections: [
            Lesson.ContentSection(
                title: "Introduction to Dictionaries",
                content: "A dictionary is a collection that stores key-value pairs. Unlike arrays that use numeric indices, dictionaries use unique keys to access values. This makes them perfect for storing related information where you need fast lookups by name or identifier.",
                codeExample: """
                // Creating a dictionary
                var student: [String: Any] = [
                    "name": "Maya Chen",
                    "age": 16,
                    "grade": "A",
                    "isActive": true
                ]
                
                // Accessing values using keys
                let studentName = student["name"] as? String
                let studentAge = student["age"] as? Int
                """
            ),
            Lesson.ContentSection(
                title: "Dictionary Operations",
                content: "Dictionaries support many operations for managing data: adding new key-value pairs, updating existing values, removing entries, and checking if keys exist. These operations are typically very fast, making dictionaries ideal for data that needs frequent updates.",
                codeExample: """
                var scores: [String: Int] = ["Alice": 85, "Bob": 92]
                
                // Adding new entries
                scores["Charlie"] = 78
                scores["Diana"] = 95
                
                // Updating existing values
                scores["Alice"] = 88
                
                // Removing entries
                scores.removeValue(forKey: "Bob")
                
                // Checking if a key exists
                if let aliceScore = scores["Alice"] {
                    print("Alice's score is \\(aliceScore)")
                }
                """
            ),
            Lesson.ContentSection(
                title: "Nested Data Structures",
                content: "Real-world data is often complex and hierarchical. You can create sophisticated data structures by nesting dictionaries within arrays, or arrays within dictionaries. This allows you to model complex relationships like a student database or inventory system.",
                codeExample: """
                // Array of dictionaries - like a database table
                let students: [[String: Any]] = [
                    ["name": "Alex", "subjects": ["Math", "Physics"], "gpa": 3.8],
                    ["name": "Sam", "subjects": ["History", "English"], "gpa": 3.6],
                    ["name": "Jordan", "subjects": ["Chemistry", "Biology"], "gpa": 3.9]
                ]
                
                // Dictionary containing arrays - grouped data
                let classList: [String: [String]] = [
                    "Math": ["Alex", "Emma", "Lucas"],
                    "Physics": ["Alex", "Sophie"],
                    "Chemistry": ["Jordan", "Emma"]
                ]
                """
            ),
            Lesson.ContentSection(
                title: "Iterating Through Dictionaries",
                content: "You can loop through dictionaries to process all key-value pairs, just the keys, or just the values. This is essential for tasks like calculating totals, finding specific entries, or transforming data.",
                codeExample: """
                let inventory: [String: Int] = [
                    "Apples": 50,
                    "Bananas": 30,
                    "Oranges": 25
                ]
                
                // Loop through key-value pairs
                for (fruit, quantity) in inventory {
                    print("We have \\(quantity) \\(fruit)")
                }
                
                // Loop through just keys
                for fruit in inventory.keys {
                    print("Available: \\(fruit)")
                }
                
                // Loop through just values
                let totalItems = inventory.values.reduce(0, +)
                print("Total inventory: \\(totalItems)")
                """
            )
        ],

        questions: [
            Lesson.Question(
                text: "What is the main difference between arrays and dictionaries?",
                options: [
                    "Arrays can only store numbers, dictionaries can store any type",
                    "Arrays use numeric indices, dictionaries use unique keys",
                    "Arrays are faster than dictionaries for all operations"
                ],
                correctOptionIndex: 1  // Index 1 is the correct answer
            ),
            Lesson.Question(
                text: "What happens when you try to access a dictionary key that doesn't exist?",
                options: [
                    "The app crashes with an error",
                    "It returns nil (optional value)",
                    "It returns an empty string"
                ],
                correctOptionIndex: 1  // Index 1 is correct - returns nil
            ),
            Lesson.Question(
                text: "Which scenario is BEST suited for using a dictionary?",
                options: [
                    "Storing a list of high scores in order",
                    "Looking up student information by student ID",
                    "Keeping track of items in a shopping cart sequence"
                ],
                correctOptionIndex: 1  // Index 1 - lookup by ID is perfect for dictionaries
            )
        ],

        resources: [
            Lesson.Resource(
                title: "Swift.org: Collection Types",
                description: "Official Swift documentation covering dictionaries and other collection types",
                url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/"
            ),
            Lesson.Resource(
                title: "Apple Developer: Dictionary",
                description: "Complete API reference for Swift Dictionary type",
                url: "https://developer.apple.com/documentation/swift/dictionary"
            )
        ]
    )
    
    static let SwiftUIBasicsLesson = Lesson(
        title: "SwiftUI Basics",
        shortTitle: "SwiftUI",
        description: "Learn to build beautiful iOS app interfaces using SwiftUI – Apple's modern framework for creating user interfaces with declarative code.",
        difficulty: .intermediate,
        duration: 35,
        videoID: "sZSlTDlo0Ag",
        slidesURL: "https://docs.google.com/presentation/d/1K-MEeuOo1wPqlmblDfbthgTj0Bb9MjwSBnKkdmsIHOg/edit?slide=id.g344e1d1e5ab_0_31#slide=id.g344e1d1e5ab_0_31",
        slideThumbnails: ["swift1", "swift2", "swift3"],
        
        goals: [
            Lesson.LessonGoal(description: "Understand SwiftUI's declarative programming approach"),
            Lesson.LessonGoal(description: "Create basic UI elements like Text, Button, and VStack"),
            Lesson.LessonGoal(description: "Build a simple interactive interface with state management")
        ],
        
        contentSections: [
            Lesson.ContentSection(
                title: "What is SwiftUI?",
                content: "SwiftUI is Apple's modern framework for building user interfaces. Instead of describing how to build the UI step by step, you describe what you want it to look like. SwiftUI figures out how to make it happen."
            ),
            Lesson.ContentSection(
                title: "Basic Views and Layout",
                content: "Views are the building blocks of SwiftUI. VStack arranges views vertically, HStack horizontally, and ZStack layers them on top of each other.",
                codeExample: """
                struct ContentView: View {
                    var body: some View {
                        VStack {
                            Text("Hello, SwiftUI!")
                                .font(.title)
                                .foregroundColor(.blue)
                            
                            HStack {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                Text("Welcome to iOS development")
                            }
                            
                            Button("Tap Me!") {
                                print("Button tapped!")
                            }
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding()
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "State and Data Binding",
                content: "Use @State to store data that can change. When state changes, SwiftUI automatically updates the interface to match.",
                codeExample: """
                struct CounterView: View {
                    @State private var count = 0
                    @State private var name = ""
                    
                    var body: some View {
                        VStack(spacing: 20) {
                            Text("Count: \\(count)")
                                .font(.largeTitle)
                            
                            HStack {
                                Button("-") {
                                    count -= 1
                                }
                                .buttonStyle(.bordered)
                                
                                Button("+") {
                                    count += 1
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            TextField("Enter your name", text: $name)
                                .textFieldStyle(.roundedBorder)
                            
                            if !name.isEmpty {
                                Text("Hello, \\(name)!")
                                    .foregroundColor(.purple)
                            }
                        }
                        .padding()
                    }
                }
                """
            )
        ],
        
        questions: [
            Lesson.Question(
                text: "What makes SwiftUI different from traditional UI frameworks?",
                options: ["It's faster", "It uses declarative syntax", "It only works on iPhone"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which property wrapper is used to store changeable data in SwiftUI?",
                options: ["@State", "@Binding", "@Published"],
                correctOptionIndex: 0
            ),
            Lesson.Question(
                text: "What does VStack do in SwiftUI?",
                options: ["Creates variables", "Arranges views vertically", "Validates input"],
                correctOptionIndex: 1
            )
        ],
        
        resources: [
            Lesson.Resource(
                title: "SwiftUI Documentation",
                description: "Apple's official SwiftUI framework documentation",
                url: "https://developer.apple.com/documentation/swiftui"
            ),
            Lesson.Resource(
                title: "SwiftUI Tutorials by Apple",
                description: "Step-by-step tutorials for learning SwiftUI",
                url: "https://developer.apple.com/tutorials/swiftui"
            )
        ]
    )
    
    static let publishLesson = Lesson(
        title: "Publishing Your ToDo App",
        shortTitle: "App Publishing",
        description: "Learn how to prepare and submit your ToDo app to the Apple App Store.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Understand the Apple Developer Program"),
            Lesson.LessonGoal(description: "Learn app signing and provisioning"),
            Lesson.LessonGoal(description: "Submit your app using Xcode")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "App Store Preparation",
                content: "Set up your Apple Developer account and configure signing, provisioning, and metadata."
            ),
            Lesson.ContentSection(
                title: "Submission and Review",
                content: "Use Xcode to upload your app and manage the App Store review process."
            )
        ],
        questions: [
            Lesson.Question(
                text: "What is required to submit apps to the App Store?",
                options: ["Apple ID", "Apple Developer Program", "MacBook"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which tool is used to upload your app?",
                options: ["Finder", "Xcode", "Terminal"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Developer Program",
                description: "Enroll to publish apps",
                url: "https://developer.apple.com/programs/"
            ),
            Lesson.Resource(
                title: "App Store Connect Help",
                description: "Official guide",
                url: "https://help.apple.com/app-store-connect/"
            )
        ]
    )

    static let whatsNextLesson = Lesson(
        title: "What’s Next After ToDo App",
        shortTitle: "Next Steps",
        description: "Explore next topics and ideas after completing your ToDo app.",
        difficulty: .beginner,
        duration: 20,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Explore advanced SwiftUI topics"),
            Lesson.LessonGoal(description: "Identify ToDo app improvements"),
            Lesson.LessonGoal(description: "Continue learning and building")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Going Further",
                content: "Learn about animations, gestures, and custom views to enhance your app."
            ),
            Lesson.ContentSection(
                title: "Next Projects",
                content: "Try new features like notifications, auth, or sync across devices."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which feature helps notify users?",
                options: ["Animations", "Local Notifications", "CloudKit"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "How can you test UI in SwiftUI?",
                options: ["UI Testing with XCTest", "Manual testing", "Ignore testing"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Tutorials",
                description: "Apple's official guide",
                url: "https://developer.apple.com/tutorials/swiftui"
            ),
            Lesson.Resource(
                title: "Ray Wenderlich Tutorials",
                description: "iOS learning resources",
                url: "https://www.raywenderlich.com/ios"
            )
        ]
    )

    static let userSettingsLesson = Lesson(
        title: "Persisting User Settings",
        shortTitle: "User Settings",
        description: "Store user preferences like theme and sorting with SwiftUI tools.",
        difficulty: .beginner,
        duration: 25,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Use UserDefaults to store settings"),
            Lesson.LessonGoal(description: "Bind settings with @AppStorage"),
            Lesson.LessonGoal(description: "Persist preferences across launches")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "UserDefaults and AppStorage",
                content: "Save and load user preferences easily with built-in SwiftUI tools."
            ),
            Lesson.ContentSection(
                title: "Reactive UI",
                content: "Update UI automatically when stored values change."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper binds to UserDefaults?",
                options: ["@State", "@Environment", "@AppStorage"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "AppStorage Docs",
                description: "Official Apple documentation",
                url: "https://developer.apple.com/documentation/swiftui/appstorage"
            ),
            Lesson.Resource(
                title: "UserDefaults Tutorial",
                description: "Hacking with Swift guide",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/using-userdefaults-with-swiftui"
            )
        ]
    )

    static let deleteTasksLesson = Lesson(
        title: "Deleting Tasks with Confirmation",
        shortTitle: "Delete Tasks",
        description: "Let users delete tasks with confirmation dialogs.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Add swipe-to-delete with alerts"),
            Lesson.LessonGoal(description: "Update UI after deletion"),
            Lesson.LessonGoal(description: "Ensure confirmation before deleting")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Delete with Alerts",
                content: "Use SwiftUI’s .alert modifier to confirm user intent."
            ),
            Lesson.ContentSection(
                title: "Update the List",
                content: "Reflect deletions immediately in the task list."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier presents an alert?",
                options: [".alert()", ".sheet()", ".popover()"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Alerts in SwiftUI",
                description: "Apple's alert documentation",
                url: "https://developer.apple.com/documentation/swiftui/view/alert(_:isPresented:actions:message:)"
            ),
            Lesson.Resource(
                title: "Swipe to Delete",
                description: "Swift with Majid tutorial",
                url: "https://swiftwithmajid.com/2020/07/22/swipe-actions-in-swiftui/"
            )
        ]
    )

    static let editTasksLesson = Lesson(
        title: "Editing Tasks in ToDo App",
        shortTitle: "Edit Tasks",
        description: "Enable users to modify tasks and update them live.",
        difficulty: .intermediate,
        duration: 40,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Create editable task views"),
            Lesson.LessonGoal(description: "Use @Binding to pass data"),
            Lesson.LessonGoal(description: "Save changes and refresh UI")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Editable Forms",
                content: "Add UI to let users change titles, dates, or status."
            ),
            Lesson.ContentSection(
                title: "Data Flow",
                content: "Pass and save changes using bindings."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which wrapper lets child views edit parent data?",
                options: ["@State", "@Binding", "@ObservedObject"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Binding Documentation",
                description: "Apple's official reference",
                url: "https://developer.apple.com/documentation/swiftui/binding"
            ),
            Lesson.Resource(
                title: "Editing in SwiftUI",
                description: "Hacking with Swift article",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/binding-and-state"
            )
        ]
    )

    static let addTasksLesson = Lesson(
        title: "Adding Tasks in ToDo App",
        shortTitle: "Add Tasks",
        description: "Create new tasks using forms and save them to your app.",
        difficulty: .beginner,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Build input forms for new tasks"),
            Lesson.LessonGoal(description: "Validate inputs before saving"),
            Lesson.LessonGoal(description: "Save tasks to your data model")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating Forms",
                content: "Use SwiftUI controls to gather new task details."
            ),
            Lesson.ContentSection(
                title: "Saving and Validating",
                content: "Check inputs and update the task list on save."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI control is used for text input?",
                options: ["Text", "TextField", "Label"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Forms in SwiftUI",
                description: "Apple’s official guide",
                url: "https://developer.apple.com/tutorials/swiftui/creating-and-combining-views"
            ),
            Lesson.Resource(
                title: "Form Validation",
                description: "Ray Wenderlich article",
                url: "https://www.raywenderlich.com/5556-swiftui-tutorial-form-validation"
            )
        ]
    )

    static let listUILesson = Lesson(
        title: "Creating ToDo List UI",
        shortTitle: "ToDo List UI",
        description: "Build the main task list using SwiftUI’s List view.",
        difficulty: .beginner,
        duration: 35,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Use List to show tasks"),
            Lesson.LessonGoal(description: "Bind completion status to UI"),
            Lesson.LessonGoal(description: "Enable swipe-to-delete")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Displaying Tasks",
                content: "Use a List view to dynamically show all tasks."
            ),
            Lesson.ContentSection(
                title: "User Interaction",
                content: "Add toggles and delete actions to make tasks interactive."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI view shows a list of items?",
                options: ["ScrollView", "List", "VStack"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Building Lists",
                description: "Apple’s SwiftUI guide",
                url: "https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation"
            ),
            Lesson.Resource(
                title: "Swipe to Delete",
                description: "Hacking with Swift guide",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/adding-swipe-to-delete-to-a-list"
            )
        ]
    )

    static let persistenceLesson = Lesson(
        title: "Data Persistence in ToDo App",
        shortTitle: "Persistence",
        description: "Connect your ToDo app to a data storage solution like Core Data or Firebase.",
        difficulty: .intermediate,
        duration: 40,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Bind data models to SwiftUI views"),
            Lesson.LessonGoal(description: "Use context for Core Data or Firebase"),
            Lesson.LessonGoal(description: "React to data changes in real time")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Data Binding",
                content: "Use SwiftUI wrappers to manage state and updates from your data source."
            ),
            Lesson.ContentSection(
                title: "Storage Integration",
                content: "Connect Core Data, Firebase, or files to persist task data."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which wrapper is used for shared data across views?",
                options: ["@State", "@ObservedObject", "@EnvironmentObject"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Data Flow",
                description: "Apple's guide to data flow",
                url: "https://developer.apple.com/tutorials/swiftui/data-flow"
            ),
            Lesson.Resource(
                title: "Core Data Tutorial",
                description: "Ray Wenderlich guide",
                url: "https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial"
            )
        ]
    )
    
    static let projectSetupLesson = Lesson(
        title: "Setting Up Your SwiftUI Project",
        shortTitle: "Project Setup",
        description: "Create a new SwiftUI project in Xcode to begin building your ToDo app.",
        difficulty: .beginner,
        duration: 15,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Create a new SwiftUI project"),
            Lesson.LessonGoal(description: "Understand project structure"),
            Lesson.LessonGoal(description: "Run the app in a simulator")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating the Project",
                content: "Use Xcode to start a new app using the SwiftUI interface."
            ),
            Lesson.ContentSection(
                title: "Project Files",
                content: "Learn where the main app file and view code live."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which interface should you choose for this app?",
                options: ["UIKit", "SwiftUI", "Storyboard"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Setup Guide",
                description: "Apple's official getting started guide",
                url: "https://developer.apple.com/tutorials/app-dev-training"
            ),
            Lesson.Resource(
                title: "SwiftUI Project Tutorial",
                description: "Sean Allen's beginner walkthrough",
                url: "https://www.youtube.com/watch?v=d1J6j84ZLQM"
            )
        ]
    )

    static let mainUILayoutLesson = Lesson(
        title: "Designing the ToDo App UI",
        shortTitle: "Main UI Layout",
        description: "Build the initial UI with a list placeholder and navigation header.",
        difficulty: .beginner,
        duration: 20,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Add a navigation title"),
            Lesson.LessonGoal(description: "Prepare a List view placeholder"),
            Lesson.LessonGoal(description: "Use VStack for layout")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Navigation Layout",
                content: "Use NavigationView to wrap the content and give the app a title."
            ),
            Lesson.ContentSection(
                title: "UI Composition",
                content: "Use VStack and List to create your layout structure."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which container provides a nav bar?",
                options: ["VStack", "NavigationView", "ScrollView"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "NavigationView Docs",
                description: "Apple’s guide to navigation UI",
                url: "https://developer.apple.com/documentation/swiftui/navigationview"
            ),
            Lesson.Resource(
                title: "SwiftUI UI Tutorial",
                description: "Kilo Loco tutorial",
                url: "https://www.youtube.com/watch?v=2-5HbIQDHrI"
            )
        ]
    )

    static let stateManagementLesson = Lesson(
        title: "Managing ToDo Items with @State",
        shortTitle: "State Management",
        description: "Use @State to store and manage dynamic lists of tasks.",
        difficulty: .beginner,
        duration: 20,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Use @State to store tasks"),
            Lesson.LessonGoal(description: "Update UI when state changes"),
            Lesson.LessonGoal(description: "Manage an array of strings")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Using @State",
                content: "Track task list changes and auto-update views."
            ),
            Lesson.ContentSection(
                title: "Dynamic Lists",
                content: "Render arrays with List and ForEach."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property updates the UI on change?",
                options: ["@Published", "@State", "@Binding"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Using @State",
                description: "Apple documentation",
                url: "https://developer.apple.com/documentation/swiftui/state"
            ),
            Lesson.Resource(
                title: "State Tutorial",
                description: "Swiftful Thinking guide",
                url: "https://www.youtube.com/watch?v=k6E7BTtn9Jw"
            )
        ]
    )

    static let userInputLesson = Lesson(
        title: "Adding Tasks with TextField",
        shortTitle: "User Input",
        description: "Use TextField and a button to add new tasks to your list.",
        difficulty: .beginner,
        duration: 25,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Bind TextField to a string"),
            Lesson.LessonGoal(description: "Add tasks with a button"),
            Lesson.LessonGoal(description: "Clear input after adding")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Capturing Input",
                content: "Use @State to bind the TextField to user input."
            ),
            Lesson.ContentSection(
                title: "Adding Tasks",
                content: "Append the new task to the list and clear the field."
            )
        ],
        questions: [
            Lesson.Question(
                text: "How do you bind a TextField's text?",
                options: ["Use $ prefix", "Use &", "Use #"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "TextField in SwiftUI",
                description: "Apple documentation",
                url: "https://developer.apple.com/documentation/swiftui/textfield"
            ),
            Lesson.Resource(
                title: "Input Tutorial",
                description: "Swiftful Thinking guide",
                url: "https://www.youtube.com/watch?v=Xw2eq3hh-7I"
            )
        ]
    )

    static let swipeToDeleteLesson = Lesson(
        title: "Deleting Tasks with Swipe",
        shortTitle: "Swipe to Delete",
        description: "Allow users to remove tasks by swiping on list rows.",
        difficulty: .beginner,
        duration: 20,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Use .onDelete on list rows"),
            Lesson.LessonGoal(description: "Remove tasks from array"),
            Lesson.LessonGoal(description: "Improve UX with swipe actions")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Deleting Tasks",
                content: "Use .onDelete modifier to enable task removal."
            ),
            Lesson.ContentSection(
                title: "Updating the List",
                content: "Refresh the UI after deletion."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier enables swipe to delete?",
                options: [".onTapGesture", ".onDelete", ".onMove"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "List Deletion Docs",
                description: "Apple official docs",
                url: "https://developer.apple.com/documentation/swiftui/list"
            ),
            Lesson.Resource(
                title: "Swipe to Delete Guide",
                description: "Swiftful Thinking tutorial",
                url: "https://www.youtube.com/watch?v=r_l3OW9wIkk"
            )
        ]
    )

    static let jsonCrudLesson = Lesson(
        title: "CRUD with JSON Files",
        shortTitle: "JSON CRUD",
        description: "Read, write, and update task data using local JSON files.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Encode tasks as JSON"),
            Lesson.LessonGoal(description: "Save and load JSON files"),
            Lesson.LessonGoal(description: "Read data at app launch")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Saving JSON",
                content: "Write JSON to local storage using JSONEncoder."
            ),
            Lesson.ContentSection(
                title: "Reading JSON",
                content: "Read JSON on app launch with JSONDecoder."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which class encodes Swift structs to JSON?",
                options: ["JSONDecoder", "JSONEncoder", "FileManager"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "JSONEncoder Docs",
                description: "Apple official docs",
                url: "https://developer.apple.com/documentation/foundation/jsonencoder"
            ),
            Lesson.Resource(
                title: "File Handling in Swift",
                description: "Swift by Sundell article",
                url: "https://www.swiftbysundell.com/articles/reading-and-writing-files-in-swift/"
            )
        ]
    )

    static let coreDataLesson = Lesson(
        title: "CRUD with Core Data",
        shortTitle: "Core Data CRUD",
        description: "Use Core Data to persist and manage ToDo tasks locally.",
        difficulty: .advanced,
        duration: 40,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Create and fetch Core Data items"),
            Lesson.LessonGoal(description: "Update and delete items"),
            Lesson.LessonGoal(description: "Use @FetchRequest in SwiftUI")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Working with Core Data",
                content: "Use Core Data with @Environment and save changes to context."
            ),
            Lesson.ContentSection(
                title: "Fetching Items",
                content: "Use @FetchRequest to show saved items in List."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which wrapper fetches Core Data items?",
                options: ["@ObservedObject", "@FetchRequest", "@State"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Core Data SwiftUI Guide",
                description: "Apple’s official tutorial",
                url: "https://developer.apple.com/tutorials/core-data-with-swiftui"
            ),
            Lesson.Resource(
                title: "Video Tutorial",
                description: "Sean Allen’s walkthrough",
                url: "https://www.youtube.com/watch?v=6Ewz6S1jT2E"
            )
        ]
    )

    static let swiftDataLesson = Lesson(
        title: "CRUD with SwiftData (iOS 17+)",
        shortTitle: "SwiftData CRUD",
        description: "Use SwiftData to manage your task list in iOS 17 and later.",
        difficulty: .advanced,
        duration: 35,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Define models with @Model"),
            Lesson.LessonGoal(description: "Perform CRUD operations"),
            Lesson.LessonGoal(description: "Bind models to SwiftUI views")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Model Declaration",
                content: "Use @Model to define SwiftData entities."
            ),
            Lesson.ContentSection(
                title: "CRUD Flow",
                content: "Insert, update, and delete data using modelContext."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which attribute declares a SwiftData model?",
                options: ["@Observable", "@Entity", "@Model"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftData WWDC",
                description: "Apple’s announcement",
                url: "https://developer.apple.com/videos/play/wwdc2023/10026/"
            ),
            Lesson.Resource(
                title: "SwiftData Tutorial",
                description: "Hacking with Swift guide",
                url: "https://www.hackingwithswift.com/articles/355/how-to-use-swiftdata-in-ios-17"
            )
        ]
    )

    static let firebaseLesson = Lesson(
        title: "CRUD with Firebase Firestore",
        shortTitle: "Firebase CRUD",
        description: "Use Firestore to sync task data with the cloud in real time.",
        difficulty: .challenging,
        duration: 50,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Set up Firebase project"),
            Lesson.LessonGoal(description: "Read and write Firestore documents"),
            Lesson.LessonGoal(description: "Listen for real-time updates")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Setting Up Firebase",
                content: "Install Firebase and connect it to your app."
            ),
            Lesson.ContentSection(
                title: "Performing CRUD",
                content: "Use Firestore APIs to create, update, delete, and observe documents."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which product enables real-time sync?",
                options: ["Storage", "Realtime Database", "Firestore"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Firestore Quickstart",
                description: "Official Firebase guide",
                url: "https://firebase.google.com/docs/firestore/quickstart"
            ),
            Lesson.Resource(
                title: "SwiftUI Firebase Tutorial",
                description: "CodeWithChris tutorial",
                url: "https://www.youtube.com/watch?v=ktO8MJlUWW8"
            )
        ]
    )
    
    static let asyncImageLesson = Lesson(
        title: "Working with AsyncImage",
        shortTitle: "AsyncImage",
        description: "Load and display remote images asynchronously in SwiftUI.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Load images from URLs using AsyncImage"),
            Lesson.LessonGoal(description: "Handle loading and error states"),
            Lesson.LessonGoal(description: "Customize AsyncImage appearance")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Loading Remote Images",
                content: "Use AsyncImage to fetch and show images from the internet."
            ),
            Lesson.ContentSection(
                title: "Customization",
                content: "Style images using modifiers like frame, clipShape, and shadow."
            )
        ],
        questions: [
            Lesson.Question(
                text: "What is AsyncImage used for?",
                options: ["Loading local images", "Displaying async remote images", "Styling views"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "How do you add a placeholder in AsyncImage?",
                options: ["Use .placeholder()", "Use a closure with ProgressView", "You can’t add placeholders"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "AsyncImage Docs",
                description: "Apple's guide to AsyncImage",
                url: "https://developer.apple.com/documentation/swiftui/asyncimage"
            ),
            Lesson.Resource(
                title: "AsyncImage Tutorial",
                description: "Sean Allen’s walkthrough",
                url: "https://www.youtube.com/watch?v=r5TwkFg0P3Y"
            )
        ]
    )

    static let listAndForEachLesson = Lesson(
        title: "Lists and ForEach in SwiftUI",
        shortTitle: "Lists & ForEach",
        description: "Build scrollable, dynamic lists with List and ForEach.",
        difficulty: .beginner,
        duration: 25,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Create scrollable views with List"),
            Lesson.LessonGoal(description: "Use ForEach to iterate over data"),
            Lesson.LessonGoal(description: "Customize list rows")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Using List",
                content: "Display items in a scrollable vertical layout."
            ),
            Lesson.ContentSection(
                title: "Using ForEach",
                content: "Generate multiple views from collections."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which view shows scrollable rows?",
                options: ["List", "VStack", "ScrollView"],
                correctOptionIndex: 0
            ),
            Lesson.Question(
                text: "What does ForEach do?",
                options: ["Creates dynamic views", "Shows a single row", "Repeats animations"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "List in SwiftUI",
                description: "Apple’s official guide",
                url: "https://developer.apple.com/documentation/swiftui/list"
            ),
            Lesson.Resource(
                title: "SwiftUI List Tutorial",
                description: "Sean Allen's video guide",
                url: "https://www.youtube.com/watch?v=AxBjl8u2jUE"
            )
        ]
    )

    static let alertsLesson = Lesson(
        title: "Using Alerts and Sheets",
        shortTitle: "Alerts & Sheets",
        description: "Show alerts and action sheets to get user decisions.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Display alerts with alert()"),
            Lesson.LessonGoal(description: "Use confirmationDialog for action sheets"),
            Lesson.LessonGoal(description: "Handle user choices")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Showing Alerts",
                content: "Use .alert to present information or warnings."
            ),
            Lesson.ContentSection(
                title: "Action Sheets",
                content: "Use confirmationDialog for multiple options."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier presents an alert?",
                options: [".alert()", ".showAlert()", ".popup()"],
                correctOptionIndex: 0
            ),
            Lesson.Question(
                text: "What are action sheets used for?",
                options: ["Error handling", "Navigation", "Presenting multiple choices"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Alerts",
                description: "Apple documentation",
                url: "https://developer.apple.com/documentation/swiftui/alert"
            ),
            Lesson.Resource(
                title: "Alerts & Sheets Tutorial",
                description: "Paul Hudson’s video guide",
                url: "https://www.youtube.com/watch?v=ZJ_FvEmz1N8"
            )
        ]
    )

    static let environmentLesson = Lesson(
        title: "Using Environment and EnvironmentObject",
        shortTitle: "Environment",
        description: "Share data across views using environment tools in SwiftUI.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Access system values with @Environment"),
            Lesson.LessonGoal(description: "Share data using @EnvironmentObject"),
            Lesson.LessonGoal(description: "Inject shared data into view hierarchy")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "System Environment Values",
                content: "Use @Environment to read values like color scheme."
            ),
            Lesson.ContentSection(
                title: "Shared App Data",
                content: "Use @EnvironmentObject to pass shared models to child views."
            )
        ],
        questions: [
            Lesson.Question(
                text: "What does @Environment give access to?",
                options: ["Network data", "System values like theme", "View state"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which wrapper shares data across many views?",
                options: ["@State", "@Binding", "@EnvironmentObject"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Environment Docs",
                description: "Apple guide to @Environment",
                url: "https://developer.apple.com/documentation/swiftui/environment"
            ),
            Lesson.Resource(
                title: "EnvironmentObject Tutorial",
                description: "Paul Hudson’s video",
                url: "https://www.youtube.com/watch?v=Kp2wKK3i1q8"
            )
        ]
    )

    static let gesturesLesson = Lesson(
        title: "Handling Gestures in SwiftUI",
        shortTitle: "Gestures",
        description: "Detect and respond to taps, long presses, and drags.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Understand basic gesture types"),
            Lesson.LessonGoal(description: "Handle taps, long presses, and drags"),
            Lesson.LessonGoal(description: "Create interactive UI with gestures")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Tap and Long Press",
                content: "Use .onTapGesture and .onLongPressGesture to respond to user interaction."
            ),
            Lesson.ContentSection(
                title: "Drag Gesture",
                content: "Track user dragging to move or animate views."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier detects taps?",
                options: [".gesture()", ".onTapGesture", ".onPressGesture"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What does DragGesture track?",
                options: ["Tap count", "Movement of a finger", "Screen rotation"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Gestures Docs",
                description: "Official Apple documentation",
                url: "https://developer.apple.com/documentation/swiftui/gesture"
            ),
            Lesson.Resource(
                title: "Gesture Tutorial",
                description: "Sean Allen’s video guide",
                url: "https://www.youtube.com/watch?v=V4qC1jwDDGg"
            )
        ]
    )

    static let animationsLesson = Lesson(
        title: "Animating Views with SwiftUI",
        shortTitle: "Animations",
        description: "Add smooth and interactive animations to views.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Use implicit and explicit animations"),
            Lesson.LessonGoal(description: "Animate view properties"),
            Lesson.LessonGoal(description: "Create state-driven animations")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Implicit vs Explicit",
                content: "Use .animation or withAnimation to animate view changes."
            ),
            Lesson.ContentSection(
                title: "Animating Properties",
                content: "Animate color, position, scale, opacity, and more."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier adds implicit animations?",
                options: [".animate()", ".animation()", ".withAnimation()"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What does withAnimation() do?",
                options: ["Starts a transition", "Wraps state changes to animate them", "Changes color mode"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Animations",
                description: "Apple's guide to animations",
                url: "https://developer.apple.com/documentation/swiftui/animation"
            ),
            Lesson.Resource(
                title: "Animations in SwiftUI",
                description: "Sean Allen's tutorial",
                url: "https://www.youtube.com/watch?v=hDXW5YgJsCw"
            )
        ]
    )

    static let customViewsLesson = Lesson(
        title: "Building Custom Views in SwiftUI",
        shortTitle: "Custom Views",
        description: "Create reusable and composable SwiftUI views.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Structure custom view components"),
            Lesson.LessonGoal(description: "Pass data into views with properties"),
            Lesson.LessonGoal(description: "Build complex UIs from smaller parts")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating a Custom View",
                content: "Make a reusable View with input parameters."
            ),
            Lesson.ContentSection(
                title: "Using the View",
                content: "Compose views in larger layouts."
            )
        ],
        questions: [
            Lesson.Question(
                text: "How do you define a reusable view?",
                options: ["Create a class", "Create a View struct", "Use a global variable"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "How do you pass data into views?",
                options: ["With a closure", "With properties", "With @State"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Custom Views in SwiftUI",
                description: "Apple’s documentation",
                url: "https://developer.apple.com/documentation/swiftui/view"
            ),
            Lesson.Resource(
                title: "Reusable Views Tutorial",
                description: "Sean Allen’s video",
                url: "https://www.youtube.com/watch?v=qyR5M-qnKn0"
            )
        ]
    )

    static let stateObjectLesson = Lesson(
        title: "@ObservedObject and @StateObject in SwiftUI",
        shortTitle: "Observed & StateObject",
        description: "Manage shared state with ObservableObject and property wrappers.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder_video_id",
        slidesURL: "https://docs.google.com/presentation/d/placeholder_slide_id/edit?usp=sharing",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Create ObservableObject classes"),
            Lesson.LessonGoal(description: "Use @ObservedObject and @StateObject"),
            Lesson.LessonGoal(description: "Understand lifecycle differences")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "ObservableObject Basics",
                content: "Use classes that publish changes to their data."
            ),
            Lesson.ContentSection(
                title: "@StateObject vs @ObservedObject",
                content: "Choose the right wrapper based on view ownership."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which wrapper creates and owns an observable object?",
                options: ["@ObservedObject", "@StateObject", "@Binding"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which wrapper observes a shared object passed into the view?",
                options: ["@StateObject", "@ObservedObject", "@Environment"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "ObservableObject in SwiftUI",
                description: "Apple docs",
                url: "https://developer.apple.com/documentation/combine/observableobject"
            ),
            Lesson.Resource(
                title: "@StateObject vs @ObservedObject",
                description: "Hacking with Swift explanation",
                url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-stateobject-to-manage-an-observableobject"
            )
        ]
    )
    
    static let dataHandlingLesson = Lesson(
        title: "Understanding State and Data Flow in SwiftUI",
        shortTitle: "State & Binding",
        description: "Explore how SwiftUI manages view state using @State, @Binding, and how data flows between views.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder-video-id",
        slidesURL: "https://placeholder.slides.url",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Use @State for local view state"),
            Lesson.LessonGoal(description: "Understand @Binding between views"),
            Lesson.LessonGoal(description: "Reactively update UI using state")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Local View State with @State",
                content: "@State allows a SwiftUI view to track and respond to changes in local variables."
            ),
            Lesson.ContentSection(
                title: "Sharing State with @Binding",
                content: "@Binding allows child views to read and write values owned by a parent view."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper is used for local mutable state in a SwiftUI view?",
                options: ["@Binding", "@State", "@ObservedObject"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What does @Binding allow you to do?",
                options: ["Create a constant value", "Share state between views", "Persist data to disk"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI State and Data Flow",
                description: "Apple’s documentation on state management",
                url: "https://developer.apple.com/documentation/swiftui/state-and-data-flow"
            ),
            Lesson.Resource(
                title: "Paul Hudson’s SwiftUI Binding Guide",
                description: "Tutorial on @State and @Binding",
                url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-binding-to-share-data-between-views"
            )
        ]
    )

    static let navigationLesson = Lesson(
        title: "Navigation and NavigationStack in SwiftUI",
        shortTitle: "Navigation",
        description: "Learn how to build navigation flows in SwiftUI using NavigationStack, NavigationLink, and programmatic navigation.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "placeholder-video-id",
        slidesURL: "https://placeholder.slides.url",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Understand NavigationStack"),
            Lesson.LessonGoal(description: "Build navigation flows"),
            Lesson.LessonGoal(description: "Use NavigationLink and destinations")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "What is NavigationStack?",
                content: "A container view that manages a stack of screens users can push and pop between."
            ),
            Lesson.ContentSection(
                title: "NavigationLink & Programmatic Navigation",
                content: "NavigationLink creates tappable transitions, and NavigationPath enables dynamic navigation."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which container replaced NavigationView in iOS 16?",
                options: ["NavigationStack", "NavigationController", "NavigationView"],
                correctOptionIndex: 0
            ),
            Lesson.Question(
                text: "What does NavigationLink do?",
                options: ["Creates a button", "Pushes a new view on the stack", "Creates a modal"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Docs: NavigationStack",
                description: "Learn how to use NavigationStack in SwiftUI",
                url: "https://developer.apple.com/documentation/swiftui/navigationstack"
            ),
            Lesson.Resource(
                title: "SwiftUI Navigation Tutorial",
                description: "Video guide for navigation patterns",
                url: "https://www.youtube.com/watch?v=f9EHvY5p8PE"
            )
        ]
    )

    static let formsLesson = Lesson(
        title: "Working with Forms and User Input in SwiftUI",
        shortTitle: "Forms & Input",
        description: "Learn how to build forms and capture user input using SwiftUI components like TextField, Toggle, Picker, and more.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder-video-id",
        slidesURL: "https://placeholder.slides.url",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Create forms to collect input"),
            Lesson.LessonGoal(description: "Use input controls like TextField and Toggle"),
            Lesson.LessonGoal(description: "Validate and manage form data")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating Forms",
                content: "Use Form, TextField, Toggle, and Picker to gather structured input from users."
            ),
            Lesson.ContentSection(
                title: "Form Validation",
                content: "Use logic to validate form entries before submission."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI view groups input controls for forms?",
                options: ["Form", "List", "Section"],
                correctOptionIndex: 0
            ),
            Lesson.Question(
                text: "How do you bind a TextField to a variable?",
                options: ["Using @State and $", "Using @Binding only", "Direct assignment"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple’s SwiftUI Forms Guide",
                description: "Documentation on form creation",
                url: "https://developer.apple.com/documentation/swiftui/form"
            ),
            Lesson.Resource(
                title: "SwiftUI Forms Tutorial",
                description: "Video on forms and user input",
                url: "https://www.youtube.com/watch?v=XvZlyC3sxro"
            )
        ]
    )

    static let errorHandlingLesson = Lesson(
        title: "Error Handling in Swift",
        shortTitle: "Error Handling",
        description: "Learn how Swift handles errors using try, catch, and throwing functions.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder-video-id",
        slidesURL: "https://placeholder.slides.url",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Understand throwing functions"),
            Lesson.LessonGoal(description: "Use try and catch properly"),
            Lesson.LessonGoal(description: "Handle errors safely")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Throwing Functions",
                content: "Mark functions with `throws` to signal they may encounter errors."
            ),
            Lesson.ContentSection(
                title: "Catching Errors",
                content: "Use `do-catch` blocks to respond to errors during execution."
            )
        ],
        questions: [
            Lesson.Question(
                text: "What keyword marks a function that can throw errors?",
                options: ["throw", "throws", "try"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which block is used to catch errors?",
                options: ["catch", "try", "do"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Swift Error Handling",
                description: "Apple's official error handling guide",
                url: "https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html"
            ),
            Lesson.Resource(
                title: "Error Handling Tutorial",
                description: "Video walkthrough of error handling",
                url: "https://www.youtube.com/watch?v=Nx8CLq_3e-A"
            )
        ]
    )

    static let protocolsLesson = Lesson(
        title: "Protocols and Delegates",
        shortTitle: "Protocols",
        description: "Learn about protocols in Swift and how delegates allow communication between classes.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder-video-id",
        slidesURL: "https://placeholder.slides.url",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Define and use protocols"),
            Lesson.LessonGoal(description: "Understand delegate pattern"),
            Lesson.LessonGoal(description: "Use delegates for object communication")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Defining Protocols",
                content: "Protocols define required methods and properties for types to adopt."
            ),
            Lesson.ContentSection(
                title: "Delegation Pattern",
                content: "Delegates enable communication between objects following a protocol."
            )
        ],
        questions: [
            Lesson.Question(
                text: "What does a protocol define?",
                options: ["Implementation", "Blueprint", "Storage"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Why use the delegate pattern?",
                options: ["UI layout", "Object communication", "Data storage"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Swift Protocols Guide",
                description: "Official Swift documentation",
                url: "https://docs.swift.org/swift-book/LanguageGuide/Protocols.html"
            ),
            Lesson.Resource(
                title: "Protocols & Delegates Video",
                description: "Video walkthrough of protocol usage",
                url: "https://www.youtube.com/watch?v=uGiQlh5yx9A"
            )
        ]
    )

    static let swiftUIListsLesson = Lesson(
        title: "Building Lists and Navigation in SwiftUI",
        shortTitle: "Lists & Nav",
        description: "Learn to build dynamic lists and navigate between views using NavigationView and NavigationLink.",
        difficulty: .intermediate,
        duration: 35,
        videoID: "placeholder-video-id",
        slidesURL: "https://placeholder.slides.url",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Build dynamic lists"),
            Lesson.LessonGoal(description: "Navigate between views"),
            Lesson.LessonGoal(description: "Understand navigation stacks")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating Lists",
                content: "Use `List` to render scrollable data collections in SwiftUI."
            ),
            Lesson.ContentSection(
                title: "Navigation Basics",
                content: "Wrap views in NavigationView and link screens with NavigationLink."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI view displays a scrollable list?",
                options: ["ScrollView", "List", "Stack"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which component navigates between views?",
                options: ["NavigationLink", "TabView", "Button"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Lists Guide",
                description: "Apple’s guide to List",
                url: "https://developer.apple.com/documentation/swiftui/list"
            ),
            Lesson.Resource(
                title: "SwiftUI Navigation Tutorial",
                description: "Learn how to navigate between views",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/building-navigation-with-navigationlink"
            )
        ]
    )

    static let stateLesson = Lesson(
        title: "Working with State in SwiftUI",
        shortTitle: "SwiftUI State",
        description: "Manage state and data flow in SwiftUI using @State, @Binding, and other property wrappers.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "placeholder-video-id",
        slidesURL: "https://placeholder.slides.url",
        slideThumbnails: ["none1", "none2", "none3"],
        goals: [
            Lesson.LessonGoal(description: "Understand @State updates"),
            Lesson.LessonGoal(description: "Use @Binding between views"),
            Lesson.LessonGoal(description: "Explore other property wrappers")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "@State Overview",
                content: "@State is for local mutable variables that trigger UI updates."
            ),
            Lesson.ContentSection(
                title: "@Binding Overview",
                content: "@Binding allows passing state from parent to child for shared updates."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper allows child views to mutate state?",
                options: ["@State", "@Binding", "@ObservedObject"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What happens when a @State variable changes?",
                options: ["Nothing", "View refreshes", "App crashes"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Managing State in SwiftUI",
                description: "Apple’s tutorial",
                url: "https://developer.apple.com/tutorials/swiftui/managing-state"
            ),
            Lesson.Resource(
                title: "SwiftUI State Video",
                description: "Tutorial on @State and @Binding",
                url: "https://www.youtube.com/watch?v=9BbtLyiqCJQ"
            )
        ]
    )
    
    static let optionalsLesson = Lesson(
        title: "Optionals in Swift",
        shortTitle: "Optionals",
        description: "Learn how Swift handles absence of values safely using optionals and unwrapping techniques.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "p8oB81ttmqA",
        slidesURL: "https://docs.google.com/presentation/d/1twK85Q9fqk_fyiW1zITzFcgo7lqdoKqlA6kgJ-6E8zZw/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Understand what optionals are and why they are useful"),
            Lesson.LessonGoal(description: "Learn how to safely unwrap optionals"),
            Lesson.LessonGoal(description: "Explore optional chaining and nil coalescing")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "What Are Optionals?",
                content: "Optionals represent a variable that can hold a value or no value (nil)."
            ),
            Lesson.ContentSection(
                title: "Unwrapping Optionals",
                content: "Use `if let` or `guard let` to safely access optional values."
            )
        ],
        questions: [
            Lesson.Question(
                text: "What does an Optional type allow in Swift?",
                options: ["Only numbers", "Value or nil", "Only strings"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which syntax safely unwraps an Optional?",
                options: ["if let", "var", "func"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Optionals — Swift Book",
                description: "Official Swift guide to optionals",
                url: "https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html"
            ),
            Lesson.Resource(
                title: "Optionals Tutorial",
                description: "Video explanation of optionals",
                url: "https://www.youtube.com/watch?v=p8oB81ttmqA"
            )
        ]
    )

    static let controlFlowLesson = Lesson(
        title: "Control Flow in Swift",
        shortTitle: "Control Flow",
        description: "Master decision making and loops in Swift using if, switch, for, and while statements.",
        difficulty: .beginner,
        duration: 30,
        videoID: "yVPEKf-7CZk",
        slidesURL: "https://docs.google.com/presentation/d/1JpxjHYsf8w8SrN6iKX2A_qigX7g8XUBGQqfgod1svMI/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Use conditional statements (if, else if, else)"),
            Lesson.LessonGoal(description: "Implement switch-case for multi-way branching"),
            Lesson.LessonGoal(description: "Write loops (for-in, while) to iterate data")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "If Statements",
                content: "Execute code conditionally using `if` and `else`."
            ),
            Lesson.ContentSection(
                title: "Switch Statement",
                content: "Simplify multi-case decisions with `switch`."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which statement is used for multi-way branching?",
                options: ["if", "switch", "loop"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What will the following print? for i in 1...3 { print(i) }",
                options: ["1 2 3", "0 1 2", "1 2"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Swift Control Flow Guide",
                description: "Detailed control flow documentation",
                url: "https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html"
            ),
            Lesson.Resource(
                title: "Swift Looping Tutorial",
                description: "Learn loops in Swift",
                url: "https://www.raywenderlich.com/459-swift-for-in-loops-tutorial"
            )
        ]
    )

    static let xcodeIntroLesson = Lesson(
        title: "iOS Development with Swift & Xcode",
        shortTitle: "iOS + Xcode",
        description: "Introduction to developing iOS apps with Swift using Xcode, MVC architecture, UIKit, and project structure.",
        difficulty: .beginner,
        duration: 30,
        videoID: "bqu6BquVi2M",
        slidesURL: "https://www.slideshare.net/slideshow/ios-development-with-swift-and-xcode/249738153",
        slideThumbnails: ["ios_xcode1", "ios_xcode2"],
        goals: [
            Lesson.LessonGoal(description: "Set up Xcode and create your first Swift-based iOS project"),
            Lesson.LessonGoal(description: "Understand basic MVC structure and navigation in UIKit/SwiftUI")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Project Basics",
                content: "Learn how an Xcode project is structured: targets, view controllers, assets, and Info.plist."
            ),
            Lesson.ContentSection(
                title: "UIKit & SwiftUI",
                content: "Explore the difference between UIKit (imperative) and SwiftUI (declarative) approaches."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which tool is used to build iOS apps with Swift?",
                options: ["Android Studio", "Xcode", "Visual Studio"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "SwiftUI is declarative, while UIKit is imperative.",
                options: ["True", "False"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI overview — Apple",
                description: "Official SwiftUI docs",
                url: "https://developer.apple.com/swiftui/"
            ),
            Lesson.Resource(
                title: "Stanford CS193p",
                description: "iOS development course using SwiftUI",
                url: "https://cs193p.sites.stanford.edu"
            )
        ]
    )

    static let closuresLesson = Lesson(
        title: "Closures in Swift",
        shortTitle: "Closures",
        description: "Understand how to write and use closures in Swift, including trailing closure syntax and capture lists.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "Q7hc8LVGbew",
        slidesURL: "https://www.slideshare.net/slideshow/closure-higherorder-function-in-swift/73621656",
        slideThumbnails: ["closures1", "closures2"],
        goals: [
            Lesson.LessonGoal(description: "Write named and trailing closures with Swift syntax"),
            Lesson.LessonGoal(description: "Handle captured variables and understand escaping closures")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Basic Syntax",
                content: "Closures are anonymous functions. They can be passed as parameters or returned as values."
            ),
            Lesson.ContentSection(
                title: "Trailing Closure",
                content: "You can simplify closures when they're the last argument of a function."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which provides a shorthand for closures when they are the final argument?",
                options: ["Leading closure", "Trailing closure", "Closure chain"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Closures can capture external variables.",
                options: ["True", "False"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Swift Closures — Swift Book",
                description: "Official Apple documentation",
                url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/"
            )
        ]
    )

    static let asyncAwaitLesson = Lesson(
        title: "Swift Concurrency: async/await",
        shortTitle: "Async/Await",
        description: "Learn Swift's async/await structured concurrency to simplify asynchronous code.",
        difficulty: .advanced,
        duration: 30,
        videoID: "BAEsdNjZDkQ",
        slidesURL: "https://www.slideshare.net/peterfriese/asyncawait-in-swift",
        slideThumbnails: ["async1", "async2"],
        goals: [
            Lesson.LessonGoal(description: "Rewrite callback-based APIs using async/await"),
            Lesson.LessonGoal(description: "Use Task and understand error handling in async code")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Avoiding Callback Hell",
                content: "Async/await allows writing asynchronous code that reads like synchronous code."
            ),
            Lesson.ContentSection(
                title: "Sample Usage",
                content: "Declare async functions and await their results."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which keyword declares an async function?",
                options: ["await", "async", "concurrent"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "async/await helps avoid nested callbacks.",
                options: ["True", "False"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Swift Structured Concurrency",
                description: "Overview of async/await",
                url: "https://swift.org/blog/swift-concurrency/"
            )
        ]
    )
}
