import Foundation

// Provides access to the app's lesson content
struct LessonData {
    // Collection of all available lessons
    static let allLessons: [Lesson] = [
        binaryLesson,
        Swiftbasics,
        dataTypesLesson,
        arraysListsLesson,
        functionsLesson,
        controlFlow,
        optionals,
        closures,
        AsyncAwait,
        XcodeIntro,
        SwiftUIBasics,
        SwiftUILists,
        Protocols,
        ErrorHandling,
        State,
        EnvironmentObject,
        Forms,
        Navigation,
        DataHandlingSwiftUI,
        DataHandlingpt2,
        CustomViews,
        Animations,
        HandlingGestures,
        Alerts,
        ForEach,
        AsyncImageLesson,
        ToDopt1,
        ToDopt2,
        ToDopt3,
        ToDopt4,
        ToDopt5,
        CrudCoreData,
        CrudSwiftData,
        CrudFirebase,
        CrudJson,
        ToDopt6,
        ToDopt7,
        ToDopt8,
        ToDopt9,
        ToDopt10,
        ToDopt11,
        WhatNext,
        Publish
    ]
    static let Publish = Lesson(
        title: "Publishing Your ToDo App to the App Store",
        shortTitle: "App Store Publishing",
        description: "Learn how to prepare, submit, and release your ToDo app on the Apple App Store, including app signing, provisioning, and metadata setup.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "2gAvwVYsXQE",  // Apple official or reliable tutorial on app submission
        slidesURL: "https://docs.google.com/presentation/d/1u6ZnNyNkVqJ7iC_3m-6_m-YG0kXFMHqQxj-mnp5ilps/edit?usp=sharing",
        slideThumbnails: ["publish1", "publish2", "publish3"],
        goals: [
            Lesson.LessonGoal(description: "Understand Apple Developer Program and account setup"),
            Lesson.LessonGoal(description: "Learn about app signing, certificates, and provisioning profiles"),
            Lesson.LessonGoal(description: "Prepare your app’s metadata and screenshots for submission"),
            Lesson.LessonGoal(description: "Submit your app using Xcode and App Store Connect"),
            Lesson.LessonGoal(description: "Manage app review process and release strategies")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Apple Developer Program",
                content: "Enroll in the Apple Developer Program ($99/year) to get access to certificates, App Store Connect, and app distribution tools."
            ),
            Lesson.ContentSection(
                title: "App Signing & Provisioning",
                content: """
                Configure your app’s signing identity and provisioning profiles to enable secure app installation on devices and distribution.
                This includes creating certificates in your developer account and setting up provisioning profiles for development and distribution.
                """
            ),
            Lesson.ContentSection(
                title: "Preparing App Store Metadata",
                content: """
                Write a compelling app description, select relevant keywords, prepare app screenshots and previews, and set the app’s pricing and availability.
                """
            ),
            Lesson.ContentSection(
                title: "Submitting Your App",
                content: """
                Use Xcode’s Archive feature to build your app for release.
                Upload your build to App Store Connect, fill out submission forms, and submit for Apple’s review.
                """
            ),
            Lesson.ContentSection(
                title: "App Review and Release",
                content: """
                Apple reviews your app for compliance with guidelines.
                Monitor the review status and once approved, you can release your app immediately or schedule a launch date.
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What is required to submit apps to the Apple App Store?",
                options: ["Free Apple ID", "Apple Developer Program membership", "Xcode installed", "All of the above"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which tool do you use to upload your app build to App Store Connect?",
                options: ["Finder", "Xcode", "Safari", "Terminal"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Developer Program Enrollment",
                description: "Official page to enroll in the developer program",
                url: "https://developer.apple.com/programs/"
            ),
            Lesson.Resource(
                title: "App Store Connect Help",
                description: "Apple’s official documentation on App Store Connect",
                url: "https://help.apple.com/app-store-connect/"
            ),
            Lesson.Resource(
                title: "Submitting Your App",
                description: "Step-by-step guide from Apple",
                url: "https://developer.apple.com/app-store/submission/"
            )
        ]
    )

    static let WhatNext = Lesson(
        title: "What’s Next After Building Your ToDo App",
        shortTitle: "Next Steps",
        description: "Explore advanced topics, app enhancement ideas, and best practices to continue growing as an iOS developer after completing your ToDo app.",
        difficulty: .beginner,
        duration: 20,
        videoID: "D6JZ0VLPgxk", // Valid video on Swift/iOS learning paths
        slidesURL: "https://docs.google.com/presentation/d/1P2oHr42xyPq3URxJqAfmtdX3RzA6S9T3hEN7C-2Mtp8/edit?usp=sharing",
        slideThumbnails: ["next1", "next2", "next3"],
        goals: [
            Lesson.LessonGoal(description: "Understand key advanced SwiftUI concepts to learn next"),
            Lesson.LessonGoal(description: "Identify ways to improve and scale your ToDo app"),
            Lesson.LessonGoal(description: "Learn about testing, deployment, and App Store preparation"),
            Lesson.LessonGoal(description: "Explore additional resources for continuous iOS development")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Deepen Your SwiftUI Knowledge",
                content: """
                Consider exploring advanced SwiftUI topics like animations, gestures, custom views, and performance optimization.
                These will help you create more polished, user-friendly apps.
                """
            ),
            Lesson.ContentSection(
                title: "Enhance Your ToDo App",
                content: """
                Ideas to extend your app:
                - Add notifications and reminders
                - Implement user authentication
                - Sync data across devices with CloudKit or Firebase
                - Improve UI with themes and accessibility support
                """
            ),
            Lesson.ContentSection(
                title: "Testing and Deployment",
                content: """
                Learn unit testing and UI testing with XCTest.
                Prepare your app for App Store submission by following Apple's guidelines on app signing, provisioning, and metadata.
                """
            ),
            Lesson.ContentSection(
                title: "Continuous Learning Resources",
                content: """
                - Apple's official SwiftUI tutorials
                - Online courses (e.g., Ray Wenderlich, Udemy)
                - iOS developer communities and forums
                - Open source projects to contribute to
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which feature could help you notify users about upcoming tasks?",
                options: ["Animations", "Local Notifications", "CloudKit", "User Authentication"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What is a recommended way to test your app’s user interface?",
                options: ["Manual testing only", "Unit tests with XCTest", "UI Testing with XCTest", "Ignore testing"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple SwiftUI Tutorials",
                description: "Official in-depth SwiftUI guides",
                url: "https://developer.apple.com/tutorials/swiftui"
            ),
            Lesson.Resource(
                title: "Ray Wenderlich iOS Tutorials",
                description: "Comprehensive tutorials for all skill levels",
                url: "https://www.raywenderlich.com/ios"
            ),
            Lesson.Resource(
                title: "Apple Developer Documentation",
                description: "Official reference for app submission and guidelines",
                url: "https://developer.apple.com/app-store/review/guidelines/"
            )
        ]
    )

    static let ToDopt11 = Lesson(
        title: "Persisting User Settings and Preferences",
        shortTitle: "User Settings",
        description: "Learn to store and retrieve user preferences like sorting order or theme using UserDefaults and AppStorage.",
        difficulty: .beginner,
        duration: 25,
        videoID: "vGUJPQ1q66k",
        slidesURL: "https://docs.google.com/presentation/d/1t7BIBDcEXc6DQit6z_ypV-LXcpaDwHKVP9v_hkZ2vTk/edit?usp=sharing",
        slideThumbnails: ["settings1", "settings2", "settings3"],
        goals: [
            Lesson.LessonGoal(description: "Use UserDefaults to store simple data"),
            Lesson.LessonGoal(description: "Use @AppStorage for SwiftUI binding"),
            Lesson.LessonGoal(description: "Persist user preferences across app launches")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "UserDefaults Basics",
                content: "Store key-value pairs for user preferences."
            ),
            Lesson.ContentSection(
                title: "@AppStorage Wrapper",
                content: "Bind UserDefaults keys to SwiftUI properties for reactive UI updates."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper provides a SwiftUI-friendly way to bind to UserDefaults?",
                options: ["@State", "@Environment", "@AppStorage"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Storing Preferences in SwiftUI",
                description: "Apple's AppStorage docs",
                url: "https://developer.apple.com/documentation/swiftui/appstorage"
            ),
            Lesson.Resource(
                title: "UserDefaults Tutorial",
                description: "Hacking with Swift article",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/using-userdefaults-with-swiftui"
            )
        ]
    )

    static let ToDopt10 = Lesson(
        title: "Deleting Tasks with Confirmation",
        shortTitle: "Delete Tasks",
        description: "Implement task deletion with user confirmation dialogs to prevent accidental removals.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "STKnM02wq2g",
        slidesURL: "https://docs.google.com/presentation/d/1BDE3vdzFM-W1u4QuBR4Fl9qX5pyif9QrldTqxU4YgEo/edit?usp=sharing",
        slideThumbnails: ["deleteTask1", "deleteTask2", "deleteTask3"],
        goals: [
            Lesson.LessonGoal(description: "Add swipe-to-delete with confirmation alerts"),
            Lesson.LessonGoal(description: "Handle deletion from data store and UI updates"),
            Lesson.LessonGoal(description: "Ensure smooth UX with alert dialogs")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Swipe to Delete",
                content: "Enable swipe actions on list rows to trigger delete."
            ),
            Lesson.ContentSection(
                title: "Confirmation Alerts",
                content: "Show an alert dialog to confirm before deleting."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI view modifier presents an alert?",
                options: [".alert()", ".sheet()", ".popover()"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Alerts in SwiftUI",
                description: "Official Apple documentation on alerts",
                url: "https://developer.apple.com/documentation/swiftui/view/alert(_:isPresented:actions:message:)"
            ),
            Lesson.Resource(
                title: "Swipe to Delete with Alert",
                description: "Swift with Majid tutorial",
                url: "https://swiftwithmajid.com/2020/07/22/swipe-actions-in-swiftui/"
            )
        ]
    )

    static let ToDopt9 = Lesson(
        title: "Updating and Editing Tasks in ToDo App",
        shortTitle: "Edit Tasks",
        description: "Enable users to edit task details and update changes in the data store with smooth UI feedback.",
        difficulty: .intermediate,
        duration: 40,
        videoID: "YZJXqc2AmXM",
        slidesURL: "https://docs.google.com/presentation/d/1k_wk_t4oP_g9R7GvTtDZfRTk7yUhtwZIVWm6qQFsPzo/edit?usp=sharing",
        slideThumbnails: ["editTask1", "editTask2", "editTask3"],
        goals: [
            Lesson.LessonGoal(description: "Create an edit view to modify task properties"),
            Lesson.LessonGoal(description: "Bind changes bidirectionally to the data model"),
            Lesson.LessonGoal(description: "Persist updates and refresh UI"),
            Lesson.LessonGoal(description: "Provide user feedback on save success")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating the Edit View",
                content: "Design a detail screen with editable fields for title, due date, and completion status."
            ),
            Lesson.ContentSection(
                title: "Data Binding and Saving",
                content: "Use @Binding to pass data into the edit view and save changes on dismissal."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI property wrapper lets child views edit parent state?",
                options: ["@State", "@Binding", "@ObservedObject"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Editing Data",
                description: "Apple's editing and binding documentation",
                url: "https://developer.apple.com/documentation/swiftui/binding"
            ),
            Lesson.Resource(
                title: "Editing Data in SwiftUI",
                description: "Hacking with Swift tutorial",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/binding-and-state"
            )
        ]
    )

    static let ToDopt8 = Lesson(
        title: "Adding New Tasks in ToDo App",
        shortTitle: "Add Tasks",
        description: "Implement UI and data logic to create new tasks, including input validation and saving to persistence layer.",
        difficulty: .beginner,
        duration: 30,
        videoID: "3zTXi8-p4rQ",
        slidesURL: "https://docs.google.com/presentation/d/1wZmgz5U8a6kzR2akMJYvOTGjyA0T3_oVu1AGmLsyHu8/edit?usp=sharing",
        slideThumbnails: ["addTask1", "addTask2", "addTask3"],
        goals: [
            Lesson.LessonGoal(description: "Build a form to input new task details"),
            Lesson.LessonGoal(description: "Validate user input before saving"),
            Lesson.LessonGoal(description: "Persist new tasks to chosen storage"),
            Lesson.LessonGoal(description: "Update UI immediately upon adding tasks")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Building Input Forms",
                content: "Use TextField, DatePicker, and Toggle controls to gather user input."
            ),
            Lesson.ContentSection(
                title: "Saving New Tasks",
                content: "On form submission, add the new task to the data model and persist it."
            ),
            Lesson.ContentSection(
                title: "Input Validation",
                content: "Prevent empty titles and invalid dates from being saved."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI control is typically used for text input?",
                options: ["Text", "TextField", "Label"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Forms Tutorial",
                description: "Apple’s official guide on forms",
                url: "https://developer.apple.com/tutorials/swiftui/creating-and-combining-views"
            ),
            Lesson.Resource(
                title: "Validating User Input",
                description: "Ray Wenderlich article",
                url: "https://www.raywenderlich.com/5556-swiftui-tutorial-form-validation"
            )
        ]
    )

    static let ToDopt7 = Lesson(
        title: "Creating ToDo List UI in SwiftUI",
        shortTitle: "ToDo List UI",
        description: "Build the main ToDo list interface in SwiftUI, showing tasks dynamically loaded from your data source with user interaction.",
        difficulty: .beginner,
        duration: 35,
        videoID: "pT4o6AOZkeE",
        slidesURL: "https://docs.google.com/presentation/d/1A1e5k87LO8eAok6lWRzTkpJ4V4OkJvXXY4lNy53cL4I/edit?usp=sharing",
        slideThumbnails: ["todoUI1", "todoUI2", "todoUI3"],
        goals: [
            Lesson.LessonGoal(description: "Design a SwiftUI List displaying ToDo items"),
            Lesson.LessonGoal(description: "Use bindings to reflect completion status"),
            Lesson.LessonGoal(description: "Implement swipe-to-delete functionality"),
            Lesson.LessonGoal(description: "Add UI elements for task editing and adding")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Displaying Tasks with List",
                content: "Use SwiftUI’s List to show the dynamic collection of tasks."
            ),
            Lesson.ContentSection(
                title: "Two-way Binding of Task Completion",
                content: "Bind the task's isComplete property to a Toggle or Checkbox UI element."
            ),
            Lesson.ContentSection(
                title: "Swipe to Delete",
                content: "Use .onDelete modifier to enable swipe-to-delete in List."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI view is best suited for displaying a scrollable list of tasks?",
                options: ["ScrollView", "List", "VStack"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Building Lists in SwiftUI",
                description: "Apple’s official list tutorial",
                url: "https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation"
            ),
            Lesson.Resource(
                title: "Swipe to Delete in SwiftUI",
                description: "Hacking with Swift tutorial",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/adding-swipe-to-delete-to-a-list"
            )
        ]
    )

    static let ToDopt6 = Lesson(
        title: "Integrating Data Persistence in ToDo App",
        shortTitle: "Persistence Integration",
        description: "Learn to connect your data persistence layer (Core Data, SwiftData, Firebase, or JSON) to the SwiftUI ToDo app’s UI with seamless data flow.",
        difficulty: .intermediate,
        duration: 40,
        videoID: "w4VtRY1J4Kw",
        slidesURL: "https://docs.google.com/presentation/d/1DQkgCExZqw9EGXl_Td6MXhrpcfS0Uv0J8S6lCw5d5KU/edit?usp=sharing",
        slideThumbnails: ["persistence1", "persistence2", "persistence3"],
        goals: [
            Lesson.LessonGoal(description: "Bind data models to SwiftUI views using @State and @ObservedObject"),
            Lesson.LessonGoal(description: "Use environment objects or contexts for Core Data and SwiftData"),
            Lesson.LessonGoal(description: "Handle real-time UI updates on data changes"),
            Lesson.LessonGoal(description: "Sync local data with external databases when applicable")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Using @State and @ObservedObject",
                content: "Manage mutable data in views by wrapping your data model in @State or @ObservedObject to update UI reactively."
            ),
            Lesson.ContentSection(
                title: "Passing Contexts and Environment Objects",
                content: "Use @Environment('\'.managedObjectContext) for Core Data and @EnvironmentObject for shared data in Firebase integration."
            ),
            Lesson.ContentSection(
                title: "Real-time UI Binding",
                content: "Ensure UI lists refresh automatically when the underlying data changes."
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper should you use for a shared, observable data model in SwiftUI?",
                options: ["@State", "@ObservedObject", "@EnvironmentObject"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Data Flow",
                description: "Apple's official data flow documentation",
                url: "https://developer.apple.com/tutorials/swiftui/data-flow"
            ),
            Lesson.Resource(
                title: "SwiftUI Core Data Integration",
                description: "Ray Wenderlich tutorial",
                url: "https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial"
            )
        ]
    )

    static let CrudJson = Lesson(
        title: "JSON File CRUD in SwiftUI",
        shortTitle: "JSON CRUD",
        description: "Learn how to save, load, and update ToDo tasks using JSON files stored locally on the device.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "L-YE7UD3V2Y",
        slidesURL: "https://docs.google.com/presentation/d/1FqijRslH7Gepf7Lk-hXbU9k5ocM9APFapCd5UOV5q7E/edit?usp=sharing",
        slideThumbnails: ["json1", "json2", "json3"],
        goals: [
            Lesson.LessonGoal(description: "Encode ToDo items to JSON"),
            Lesson.LessonGoal(description: "Save JSON data to device storage"),
            Lesson.LessonGoal(description: "Load and decode JSON on app launch"),
            Lesson.LessonGoal(description: "Update JSON file on changes")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Encoding and Saving JSON",
                content: "Use JSONEncoder to convert Swift structs to JSON and write to a file.",
                codeExample: """
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(tasks) {
                    let url = getDocumentsDirectory().appendingPathComponent("tasks.json")
                    try? data.write(to: url)
                }
                """
            ),
            Lesson.ContentSection(
                title: "Loading and Decoding JSON",
                content: "Read JSON data from file and decode it into Swift structs.",
                codeExample: """
                let url = getDocumentsDirectory().appendingPathComponent("tasks.json")
                if let data = try? Data(contentsOf: url) {
                    let decoder = JSONDecoder()
                    let loadedTasks = try? decoder.decode([Task].self, from: data)
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which class converts Swift structs to JSON data?",
                options: ["JSONDecoder", "JSONEncoder", "FileManager"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Working with JSON in Swift",
                description: "Apple’s official JSON handling docs",
                url: "https://developer.apple.com/documentation/foundation/jsonencoder"
            ),
            Lesson.Resource(
                title: "Swift JSON File Tutorial",
                description: "Swift by Sundell article",
                url: "https://www.swiftbysundell.com/articles/reading-and-writing-files-in-swift/"
            )
        ]
    )

    static let CrudFirebase = Lesson(
        title: "Firebase Firestore CRUD in SwiftUI",
        shortTitle: "Firebase CRUD",
        description: "Learn how to integrate Firebase Firestore in a SwiftUI app to perform real-time CRUD operations on ToDo tasks.",
        difficulty: .intermediate,
        duration: 50,
        videoID: "ktO8MJlUWW8",
        slidesURL: "https://docs.google.com/presentation/d/1dOwQrJ2Jx7Gz8IvfrA6Cz8Xd_qJImY6c_TidYswNleA/edit?usp=sharing",
        slideThumbnails: ["firebase1", "firebase2", "firebase3"],
        goals: [
            Lesson.LessonGoal(description: "Set up Firebase in Xcode project"),
            Lesson.LessonGoal(description: "Connect SwiftUI app to Firestore database"),
            Lesson.LessonGoal(description: "Create, read, update, and delete Firestore documents"),
            Lesson.LessonGoal(description: "Observe real-time updates with Firestore listeners")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Integrating Firebase SDK",
                content: "Add Firebase dependencies via Swift Package Manager and configure the app."
            ),
            Lesson.ContentSection(
                title: "CRUD Operations with Firestore",
                content: "Use Firestore SDK methods to manage documents.",
                codeExample: """
                // Adding a task
                let db = Firestore.firestore()
                db.collection("tasks").addDocument(data: [
                    "title": "New Task",
                    "isComplete": false,
                    "timestamp": Timestamp()
                ])

                // Listening for updates
                db.collection("tasks").addSnapshotListener { snapshot, error in
                    if let documents = snapshot?.documents {
                        // Map documents to model
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which Firebase product is best suited for real-time data syncing?",
                options: ["Realtime Database", "Firestore", "Storage"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Firebase Firestore Quickstart",
                description: "Official Firebase Firestore guide",
                url: "https://firebase.google.com/docs/firestore/quickstart"
            ),
            Lesson.Resource(
                title: "SwiftUI Firebase Tutorial",
                description: "CodeWithChris tutorial",
                url: "https://www.youtube.com/watch?v=ktO8MJlUWW8"
            )
        ]
    )

    static let CrudSwiftData = Lesson(
        title: "SwiftData CRUD in SwiftUI (iOS 17+)",
        shortTitle: "SwiftData CRUD",
        description: "Master creating, reading, updating, and deleting data using the new SwiftData framework introduced in iOS 17.",
        difficulty: .intermediate,
        duration: 35,
        videoID: "g4ZDxWpQOZ8",
        slidesURL: "https://docs.google.com/presentation/d/1_g9NqzXro8E1P-HNbdYoR01CVgWLToQttcykrQjQ15A/edit?usp=sharing",
        slideThumbnails: ["swiftdata1", "swiftdata2", "swiftdata3"],
        goals: [
            Lesson.LessonGoal(description: "Understand SwiftData model declaration"),
            Lesson.LessonGoal(description: "Perform CRUD operations with @Model and @Observable"),
            Lesson.LessonGoal(description: "Bind SwiftData entities to SwiftUI views"),
            Lesson.LessonGoal(description: "Save and update data seamlessly with SwiftData")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Declaring SwiftData Models",
                content: "Use @Model attribute to define your data models.",
                codeExample: """
                @Model
                class ToDoItem {
                    var id: UUID
                    var title: String
                    var isComplete: Bool

                    init(id: UUID = UUID(), title: String, isComplete: Bool = false) {
                        self.id = id
                        self.title = title
                        self.isComplete = isComplete
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "CRUD with SwiftData",
                content: "Create, update, delete entities by modifying @Model instances and saving the context.",
                codeExample: """
                // Creating a new item
                let newTask = ToDoItem(title: "New Task")
                modelContext.insert(newTask)

                // Updating an item
                task.isComplete.toggle()

                // Deleting an item
                modelContext.delete(task)

                try? modelContext.save()
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What attribute marks a SwiftData model class?",
                options: ["@Observable", "@Entity", "@Model"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Introducing SwiftData",
                description: "Apple’s SwiftData announcement",
                url: "https://developer.apple.com/videos/play/wwdc2023/10026/"
            ),
            Lesson.Resource(
                title: "SwiftData Tutorial",
                description: "Paul Hudson’s SwiftData guide",
                url: "https://www.hackingwithswift.com/articles/355/how-to-use-swiftdata-in-ios-17"
            )
        ]
    )

    static let CrudCoreData = Lesson(
        title: "Core Data CRUD in SwiftUI",
        shortTitle: "Core Data CRUD",
        description: "Learn how to create, read, update, and delete ToDo items using Core Data in a SwiftUI app.",
        difficulty: .intermediate,
        duration: 40,
        videoID: "6Ewz6S1jT2E",
        slidesURL: "https://docs.google.com/presentation/d/1ZcQFQOzWrhnMXQZhA5vAKvprIjqSKNOXc6U3rM5eyMg/edit?usp=sharing",
        slideThumbnails: ["coredata1", "coredata2", "coredata3"],
        goals: [
            Lesson.LessonGoal(description: "Set up Core Data stack in SwiftUI project"),
            Lesson.LessonGoal(description: "Create new ToDo items and save to Core Data"),
            Lesson.LessonGoal(description: "Fetch and display Core Data entities in List"),
            Lesson.LessonGoal(description: "Update and delete items in Core Data")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Setting up Core Data in SwiftUI",
                content: "Use the @Environment('\'.managedObjectContext) to access Core Data context in views."
            ),
            Lesson.ContentSection(
                title: "Creating Items",
                content: "Create new managed objects and save the context.",
                codeExample: """
                let newItem = ToDoItem(context: viewContext)
                newItem.title = "New Task"
                newItem.timestamp = Date()

                do {
                    try viewContext.save()
                } catch {
                    // handle error
                }
                """
            ),
            Lesson.ContentSection(
                title: "Fetching Items",
                content: "Use @FetchRequest to get items from Core Data and display in a SwiftUI List.",
                codeExample: """
                @FetchRequest(
                    sortDescriptors: [NSSortDescriptor(keyPath: \\ToDoItem.timestamp, ascending: true)],
                    animation: .default)
                private var items: FetchedResults<ToDoItem>
                """
            ),
            Lesson.ContentSection(
                title: "Updating and Deleting Items",
                content: "Modify properties and delete objects from the context, then save changes.",
                codeExample: """
                // Update
                item.title = "Updated Task"
                try? viewContext.save()

                // Delete
                viewContext.delete(item)
                try? viewContext.save()
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper fetches Core Data entities in SwiftUI?",
                options: ["@ObservedObject", "@FetchRequest", "@State"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Core Data with SwiftUI",
                description: "Official guide from Apple",
                url: "https://developer.apple.com/tutorials/core-data-with-swiftui"
            ),
            Lesson.Resource(
                title: "Core Data SwiftUI Tutorial",
                description: "Sean Allen’s video tutorial",
                url: "https://www.youtube.com/watch?v=6Ewz6S1jT2E"
            )
        ]
    )

    static let ToDopt5 = Lesson(
        title: "ToDo App: Deleting Tasks with Swipe-to-Delete",
        shortTitle: "Swipe to Delete",
        description: "Learn how to allow users to delete tasks by swiping left on list items.",
        difficulty: .beginner,
        duration: 20,
        videoID: "r_l3OW9wIkk",
        slidesURL: "https://docs.google.com/presentation/d/1GEOW-6KZMYqOQJ1pTsTNRNTD5q_VwIdOe7xK3CEfc2Y/edit?usp=sharing",
        slideThumbnails: ["delete1", "delete2", "delete3"],
        goals: [
            Lesson.LessonGoal(description: "Enable swipe to delete on List rows"),
            Lesson.LessonGoal(description: "Use .onDelete modifier to update data"),
            Lesson.LessonGoal(description: "Remove tasks from the state array")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Implementing Swipe to Delete",
                content: "Use the .onDelete modifier on ForEach inside a List.",
                codeExample: """
                List {
                    ForEach(tasks, id: \\ .self) { task in
                        Text(task)
                    }
                    .onDelete { indexSet in
                        tasks.remove(atOffsets: indexSet)
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier is used to enable swipe to delete?",
                options: [".onTapGesture", ".onDelete", ".onMove"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple List Editing",
                description: "Official docs on editing lists",
                url: "https://developer.apple.com/documentation/swiftui/list"
            ),
            Lesson.Resource(
                title: "Swipe to Delete Tutorial",
                description: "Swiftful Thinking tutorial",
                url: "https://www.youtube.com/watch?v=r_l3OW9wIkk"
            )
        ]
    )

    static let ToDopt4 = Lesson(
        title: "ToDo App: Adding New Tasks with TextField",
        shortTitle: "User Input",
        description: "Create an input field to add new tasks dynamically to the ToDo list.",
        difficulty: .beginner,
        duration: 25,
        videoID: "Xw2eq3hh-7I",
        slidesURL: "https://docs.google.com/presentation/d/1MGJq-YcB2ZqjEqO0hC8ueJ5zriZV7DyybRG-VMPlwms/edit?usp=sharing",
        slideThumbnails: ["textfield1", "textfield2", "textfield3"],
        goals: [
            Lesson.LessonGoal(description: "Create a TextField bound to @State string"),
            Lesson.LessonGoal(description: "Add an 'Add' button to append tasks"),
            Lesson.LessonGoal(description: "Clear the input field after adding a task")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Binding TextField to State",
                content: "Use a @State string to capture user input.",
                codeExample: """
                @State private var newTask = ""

                VStack {
                    TextField("New Task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button("Add Task") {
                        tasks.append(newTask)
                        newTask = ""
                    }
                    .disabled(newTask.isEmpty)
                    .padding()
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "How do you bind a TextField’s text to a variable?",
                options: ["Use $ prefix", "Use & prefix", "No binding needed"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI TextField Docs",
                description: "Official documentation on TextField",
                url: "https://developer.apple.com/documentation/swiftui/textfield"
            ),
            Lesson.Resource(
                title: "TextField and Buttons",
                description: "Swiftful Thinking tutorial",
                url: "https://www.youtube.com/watch?v=Xw2eq3hh-7I"
            )
        ]
    )

    static let ToDopt3 = Lesson(
        title: "ToDo App: Managing ToDo Items with @State",
        shortTitle: "State Management",
        description: "Learn how to use @State to store and manage the list of ToDo items dynamically.",
        difficulty: .beginner,
        duration: 20,
        videoID: "k6E7BTtn9Jw",
        slidesURL: "https://docs.google.com/presentation/d/1MEoN8Ulx-2u90k7A62xlt2AL0kzqIyBWYTvWeqT6HnY/edit?usp=sharing",
        slideThumbnails: ["state1", "state2", "state3"],
        goals: [
            Lesson.LessonGoal(description: "Declare @State variables to store ToDo items"),
            Lesson.LessonGoal(description: "Update the UI when state changes"),
            Lesson.LessonGoal(description: "Use an array of strings to hold tasks")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Introducing @State",
                content: "Use @State to create a mutable source of truth for the task list.",
                codeExample: """
                @State private var tasks = ["Buy groceries", "Walk the dog"]

                var body: some View {
                    List(tasks, id: \\ .self) { task in
                        Text(task)
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What keyword allows SwiftUI views to react to data changes?",
                options: ["@Published", "@State", "@Binding"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "@State in SwiftUI",
                description: "Official documentation",
                url: "https://developer.apple.com/documentation/swiftui/state"
            ),
            Lesson.Resource(
                title: "State Management Tutorial",
                description: "Swiftful Thinking’s tutorial",
                url: "https://www.youtube.com/watch?v=k6E7BTtn9Jw"
            )
        ]
    )

    static let ToDopt2 = Lesson(
        title: "ToDo App: Designing the Main ToDo List UI",
        shortTitle: "Main UI Layout",
        description: "Create the basic user interface showing a list placeholder for tasks and a header for the ToDo app.",
        difficulty: .beginner,
        duration: 20,
        videoID: "2-5HbIQDHrI",
        slidesURL: "https://docs.google.com/presentation/d/1QjrKd4QayvSfjGhHbOxWl_4MokjpHJrW8r_iRUkS9Ic/edit?usp=sharing",
        slideThumbnails: ["ui1", "ui2", "ui3"],
        goals: [
            Lesson.LessonGoal(description: "Add a title header using Text"),
            Lesson.LessonGoal(description: "Prepare a List view placeholder"),
            Lesson.LessonGoal(description: "Use VStack and NavigationView for layout")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating a Navigation View",
                content: "Use NavigationView to wrap the main content and add a navigation title.",
                codeExample: """
                NavigationView {
                    VStack {
                        Text("My ToDo List")
                            .font(.largeTitle)
                            .padding()
                        List {
                            Text("No tasks yet")
                        }
                    }
                    .navigationTitle("ToDo App")
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which container gives you a navigation bar in SwiftUI?",
                options: ["VStack", "NavigationView", "ScrollView"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "NavigationView Documentation",
                description: "Apple’s official NavigationView docs",
                url: "https://developer.apple.com/documentation/swiftui/navigationview"
            ),
            Lesson.Resource(
                title: "SwiftUI List and Navigation",
                description: "Kilo Loco’s tutorial",
                url: "https://www.youtube.com/watch?v=2-5HbIQDHrI"
            )
        ]
    )

    static let ToDopt1 = Lesson(
        title: "ToDo App: Setting Up Your SwiftUI Project",
        shortTitle: "Project Setup",
        description: "Learn how to create a new SwiftUI project in Xcode to start building your ToDo app.",
        difficulty: .beginner,
        duration: 15,
        videoID: "d1J6j84ZLQM",
        slidesURL: "https://docs.google.com/presentation/d/1NGpZcIQvGZ2R1IFU7WnE-JdRnMtYwImrOKW7pq9lA54/edit?usp=sharing",
        slideThumbnails: ["setup1", "setup2", "setup3"],
        goals: [
            Lesson.LessonGoal(description: "Create a new SwiftUI project in Xcode"),
            Lesson.LessonGoal(description: "Understand the project structure"),
            Lesson.LessonGoal(description: "Run the empty app on a simulator")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Starting a SwiftUI Project",
                content: "Open Xcode, select 'App' template, name your project 'ToDoApp', choose SwiftUI as interface, Swift as language."
            ),
            Lesson.ContentSection(
                title: "Project Structure Overview",
                content: "Learn about App entry point, ContentView, and how SwiftUI uses @main."
            )
        ],
        questions: [
            Lesson.Question(
                text: "What interface option should you select for the ToDo app?",
                options: ["UIKit", "SwiftUI", "Storyboard"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Creating a SwiftUI App",
                description: "Apple’s official guide to starting a SwiftUI project",
                url: "https://developer.apple.com/tutorials/app-dev-training"
            ),
            Lesson.Resource(
                title: "SwiftUI Project Setup Tutorial",
                description: "Sean Allen’s video guide",
                url: "https://www.youtube.com/watch?v=d1J6j84ZLQM"
            )
        ]
    )

    static let AsyncImageLesson = Lesson(
        title: "Working with AsyncImage in SwiftUI",
        shortTitle: "AsyncImage",
        description: "Learn how to load and display remote images asynchronously in SwiftUI using the AsyncImage view.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "r5TwkFg0P3Y", // AsyncImage tutorial by Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1IkUeFD0XyOSXsvjHXLdYjUrIqJd7MgIF4jcXBbc5d3M/edit?usp=sharing",
        slideThumbnails: ["async1", "async2", "async3"],
        goals: [
            Lesson.LessonGoal(description: "Understand how AsyncImage loads images from URLs"),
            Lesson.LessonGoal(description: "Handle placeholder and error states"),
            Lesson.LessonGoal(description: "Customize AsyncImage appearance and behavior")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Basic AsyncImage Usage",
                content: "Load an image asynchronously from a URL and display it.",
                codeExample: """
                AsyncImage(url: URL(string: "https://example.com/image.jpg")) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                """
            ),
            Lesson.ContentSection(
                title: "Handling Loading and Errors",
                content: "Show placeholders while loading and fallback images on failure.",
                codeExample: """
                AsyncImage(url: URL(string: "https://example.com/image.jpg")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Customizing AsyncImage",
                content: "Apply modifiers like clipping, shadows, and overlays.",
                codeExample: """
                AsyncImage(url: URL(string: "https://example.com/image.jpg")) { image in
                    image.resizable()
                         .clipShape(Circle())
                         .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What does AsyncImage do?",
                options: [
                    "Loads images synchronously",
                    "Loads remote images asynchronously",
                    "Caches images locally"
                ],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "How do you provide a placeholder while the image loads?",
                options: [
                    "Using a ProgressView in the placeholder closure",
                    "Using .placeholder() modifier",
                    "AsyncImage does not support placeholders"
                ],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Documentation on AsyncImage",
                description: "Official guide to AsyncImage",
                url: "https://developer.apple.com/documentation/swiftui/asyncimage"
            ),
            Lesson.Resource(
                title: "AsyncImage SwiftUI Tutorial",
                description: "Sean Allen’s AsyncImage tutorial",
                url: "https://www.youtube.com/watch?v=r5TwkFg0P3Y"
            )
        ]
    )

    static let ForEach = Lesson(
        title: "Lists and ForEach in SwiftUI",
        shortTitle: "Lists & ForEach",
        description: "Learn how to display dynamic, scrollable lists of data in SwiftUI using List and ForEach.",
        difficulty: .beginner,
        duration: 25,
        videoID: "AxBjl8u2jUE", // SwiftUI Lists tutorial by Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1qfzPsq1ReHBrHVCJ9jxSSdqkiQdjq2Pw2M2X2yO1gX0/edit?usp=sharing",
        slideThumbnails: ["list1", "list2", "list3"],
        goals: [
            Lesson.LessonGoal(description: "Create scrollable lists using List"),
            Lesson.LessonGoal(description: "Use ForEach to iterate over collections"),
            Lesson.LessonGoal(description: "Customize list rows and styles")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Basic List",
                content: "Use List to display simple scrollable data.",
                codeExample: """
                let fruits = ["Apple", "Banana", "Cherry"]

                var body: some View {
                    List(fruits, id: \\.self) { fruit in
                        Text(fruit)
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Using ForEach",
                content: "ForEach lets you create views dynamically inside other views.",
                codeExample: """
                var body: some View {
                    VStack {
                        ForEach(fruits, id: \\.self) { fruit in
                            Text(fruit)
                        }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Customizing Rows",
                content: "You can customize rows with images, buttons, or navigation.",
                codeExample: """
                List(fruits, id: \\.self) { fruit in
                    HStack {
                        Image(systemName: "leaf")
                        Text(fruit)
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI view displays scrollable rows of data?",
                options: ["List", "ScrollView", "VStack"],
                correctOptionIndex: 0
            ),
            Lesson.Question(
                text: "What does ForEach do?",
                options: [
                    "Creates multiple views dynamically",
                    "Scrolls content vertically",
                    "Displays a single view"
                ],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Documentation on List",
                description: "Official List guide",
                url: "https://developer.apple.com/documentation/swiftui/list"
            ),
            Lesson.Resource(
                title: "SwiftUI Lists Tutorial",
                description: "Sean Allen’s guide to Lists",
                url: "https://www.youtube.com/watch?v=AxBjl8u2jUE"
            )
        ]
    )

    static let Alerts = Lesson(
        title: "Using Alerts and ActionSheets in SwiftUI",
        shortTitle: "Alerts & Sheets",
        description: "Learn how to present alerts and action sheets to communicate important information or get user decisions in your SwiftUI apps.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "ZJ_FvEmz1N8", // SwiftUI Alerts tutorial by Paul Hudson
        slidesURL: "https://docs.google.com/presentation/d/1XGiPjXQ7vzWNu7PFTDjM7r4yN5bsTP5cck06MWOBRwQ/edit?usp=sharing",
        slideThumbnails: ["alert1", "alert2", "alert3"],
        goals: [
            Lesson.LessonGoal(description: "Understand how to display alerts"),
            Lesson.LessonGoal(description: "Use action sheets for multiple choices"),
            Lesson.LessonGoal(description: "Handle user responses from alerts and sheets")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Showing Alerts",
                content: "Use the alert() modifier to show simple alert dialogs.",
                codeExample: """
                @State private var showAlert = false

                var body: some View {
                    Button("Show Alert") {
                        showAlert = true
                    }
                    .alert("Important Message", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Using ActionSheets",
                content: "ActionSheets present multiple button choices to the user.",
                codeExample: """
                @State private var showSheet = false

                var body: some View {
                    Button("Show Options") {
                        showSheet = true
                    }
                    .confirmationDialog("Choose an option", isPresented: $showSheet) {
                        Button("Delete", role: .destructive) { }
                        Button("Cancel", role: .cancel) { }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Handling User Responses",
                content: "React to which button the user taps inside your alert or sheet.",
                codeExample: """
                .alert("Confirm Delete?", isPresented: $showAlert) {
                    Button("Delete", role: .destructive) {
                        print("Deleted")
                    }
                    Button("Cancel", role: .cancel) { }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier shows an alert in SwiftUI?",
                options: [".alert()", ".showAlert()", ".popup()"],
                correctOptionIndex: 0
            ),
            Lesson.Question(
                text: "What is an action sheet used for?",
                options: [
                    "Showing a single message",
                    "Presenting multiple button choices",
                    "Navigating between screens"
                ],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Documentation on Alerts",
                description: "Official alert guide",
                url: "https://developer.apple.com/documentation/swiftui/alert"
            ),
            Lesson.Resource(
                title: "SwiftUI Alerts and Action Sheets",
                description: "Paul Hudson’s tutorial",
                url: "https://www.youtube.com/watch?v=ZJ_FvEmz1N8"
            )
        ]
    )

    static let EnvironmentObject = Lesson(
        title: "Using Environment and EnvironmentObject in SwiftUI",
        shortTitle: "Environment",
        description: "Learn how to manage and share app-wide data using @Environment and @EnvironmentObject property wrappers in SwiftUI.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "Kp2wKK3i1q8", // SwiftUI Environment tutorial by Paul Hudson
        slidesURL: "https://docs.google.com/presentation/d/1VbZHZy8K1EDZ3FhY5lhh3iyAX8vZ0O-0XfDUZTfJk_Y/edit?usp=sharing",
        slideThumbnails: ["env1", "env2", "env3"],
        goals: [
            Lesson.LessonGoal(description: "Understand the purpose of @Environment for system-provided values"),
            Lesson.LessonGoal(description: "Use @EnvironmentObject to share data across many views"),
            Lesson.LessonGoal(description: "Set up and inject environment objects in your app")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "@Environment Basics",
                content: "@Environment lets you access system values like color scheme or locale.",
                codeExample: """
                @Environment(\\.colorScheme) var colorScheme
                
                var body: some View {
                    Text("Current mode: \\(colorScheme == .dark ? "Dark" : "Light")")
                }
                """
            ),
            Lesson.ContentSection(
                title: "@EnvironmentObject Usage",
                content: "Use @EnvironmentObject to share observable data throughout your app.",
                codeExample: """
                class UserSettings: ObservableObject {
                    @Published var username = "Guest"
                }
                
                struct ContentView: View {
                    @EnvironmentObject var settings: UserSettings
                    
                    var body: some View {
                        Text("Hello, \\(settings.username)!")
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Injecting EnvironmentObject",
                content: "Inject environment objects in your app entry point.",
                codeExample: """
                @main
                struct MyApp: App {
                    @StateObject private var settings = UserSettings()
                    
                    var body: some Scene {
                        WindowGroup {
                            ContentView()
                                .environmentObject(settings)
                        }
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What does @Environment provide access to?",
                options: [
                    "User data",
                    "System environment values like color scheme",
                    "Network data"
                ],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What property wrapper is used to share data across many views?",
                options: ["@State", "@Binding", "@EnvironmentObject"],
                correctOptionIndex: 2
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Documentation on Environment and EnvironmentObject",
                description: "Official guide on environment values",
                url: "https://developer.apple.com/documentation/swiftui/environment"
            ),
            Lesson.Resource(
                title: "SwiftUI EnvironmentObject Tutorial",
                description: "Paul Hudson’s guide to EnvironmentObjects",
                url: "https://www.youtube.com/watch?v=Kp2wKK3i1q8"
            )
        ]
    )

    static let HandlingGestures = Lesson(
        title: "Handling Gestures in SwiftUI",
        shortTitle: "Gestures",
        description: "Learn how to detect and respond to user gestures like taps, drags, long presses, and more in SwiftUI.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "V4qC1jwDDGg", // SwiftUI Gestures tutorial by Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1Qz09yxhKq5Ys7F0Q3Wq7V9eHt6EoP3Qw3V1MpqQeRYc/edit?usp=sharing",
        slideThumbnails: ["gesture1", "gesture2", "gesture3"],
        goals: [
            Lesson.LessonGoal(description: "Understand basic gesture types in SwiftUI"),
            Lesson.LessonGoal(description: "Implement tap, long press, and drag gestures"),
            Lesson.LessonGoal(description: "Combine gestures and customize gesture behavior")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Tap Gesture",
                content: "Detect simple taps using `.onTapGesture`.",
                codeExample: """
                Circle()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        print("Circle tapped!")
                    }
                """
            ),
            Lesson.ContentSection(
                title: "Long Press Gesture",
                content: "Detect when the user presses and holds a view.",
                codeExample: """
                Rectangle()
                    .frame(width: 100, height: 100)
                    .onLongPressGesture {
                        print("Long press detected")
                    }
                """
            ),
            Lesson.ContentSection(
                title: "Drag Gesture",
                content: "Track dragging motion using `.gesture` with `DragGesture()`.",
                codeExample: """
                struct DraggableCircle: View {
                    @State private var offset = CGSize.zero
                    
                    var body: some View {
                        Circle()
                            .frame(width: 100, height: 100)
                            .offset(offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        offset = gesture.translation
                                    }
                                    .onEnded { _ in
                                        offset = .zero
                                    }
                            )
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier detects simple tap gestures?",
                options: [".gesture", ".onTapGesture", ".onPressGesture"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What does a DragGesture track?",
                options: ["Touch location changes", "Tap counts", "Swipe direction only"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple SwiftUI Gestures",
                description: "Official documentation on gestures",
                url: "https://developer.apple.com/documentation/swiftui/gesture"
            ),
            Lesson.Resource(
                title: "SwiftUI Gesture Tutorial",
                description: "Comprehensive guide to gestures",
                url: "https://www.youtube.com/watch?v=V4qC1jwDDGg"
            )
        ]
    )

    static let Animations = Lesson(
        title: "Animating Views with SwiftUI",
        shortTitle: "Animations",
        description: "Learn how to add smooth and interactive animations to your SwiftUI apps using built-in modifiers and animation types.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "hDXW5YgJsCw", // SwiftUI Animation tutorial by Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1uNy7ZT48aTzHSXLOtq-YFhU5h1bGf4Xd1QYH3WihzDY/edit?usp=sharing",
        slideThumbnails: ["animation1", "animation2", "animation3"],
        goals: [
            Lesson.LessonGoal(description: "Understand how to apply implicit and explicit animations"),
            Lesson.LessonGoal(description: "Use animation modifiers to animate view properties"),
            Lesson.LessonGoal(description: "Create interactive and state-driven animations")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Implicit Animations",
                content: "Apply `.animation()` modifier to animate changes automatically.",
                codeExample: """
                struct AnimatedCircle: View {
                    @State private var scale: CGFloat = 1
                    
                    var body: some View {
                        Circle()
                            .scaleEffect(scale)
                            .animation(.easeInOut(duration: 1), value: scale)
                            .onTapGesture {
                                scale = scale == 1 ? 1.5 : 1
                            }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Explicit Animations",
                content: "Use `withAnimation` to wrap state changes and trigger animations explicitly.",
                codeExample: """
                Button("Toggle") {
                    withAnimation(.spring()) {
                        showDetails.toggle()
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Animating View Properties",
                content: "You can animate properties like opacity, position, color, rotation, and more.",
                codeExample: """
                Rectangle()
                    .fill(isOn ? Color.green : Color.red)
                    .opacity(isOn ? 1 : 0.5)
                    .animation(.default, value: isOn)
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which modifier allows you to add implicit animations to a view?",
                options: [".animate()", ".animation()", ".withAnimation()"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What does the `withAnimation` function do?",
                options: [
                    "Wraps state changes to animate them explicitly",
                    "Creates a new view",
                    "Stops animations"
                ],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple SwiftUI Animations",
                description: "Official documentation on SwiftUI animations",
                url: "https://developer.apple.com/documentation/swiftui/animation"
            ),
            Lesson.Resource(
                title: "SwiftUI Animation Tutorial",
                description: "Learn animations step-by-step",
                url: "https://www.youtube.com/watch?v=hDXW5YgJsCw"
            )
        ]
    )

    static let CustomViews = Lesson(
        title: "Building Custom Views in SwiftUI",
        shortTitle: "Custom Views",
        description: "Learn how to create reusable, customizable views to build modular SwiftUI interfaces.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "qyR5M-qnKn0", // SwiftUI custom views tutorial by Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1v37KwKQchPZRLqw7VPck5ql2zp2NO4w3Btg4MR8YQIk/edit?usp=sharing",
        slideThumbnails: ["customview1", "customview2", "customview3"],
        goals: [
            Lesson.LessonGoal(description: "Understand how to structure custom SwiftUI views"),
            Lesson.LessonGoal(description: "Pass data via properties to customize views"),
            Lesson.LessonGoal(description: "Compose complex UI from smaller views")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating a Custom View",
                content: "Define a new struct conforming to View to create reusable UI components.",
                codeExample: """
                struct BadgeView: View {
                    var text: String
                    
                    var body: some View {
                        Text(text)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Using Custom Views",
                content: "Use your custom views just like any built-in SwiftUI view.",
                codeExample: """
                struct ContentView: View {
                    var body: some View {
                        VStack {
                            BadgeView(text: "New")
                            BadgeView(text: "Sale")
                        }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Passing Data to Views",
                content: "Use properties to customize your views dynamically.",
                codeExample: """
                struct ProfilePicture: View {
                    var imageName: String
                    
                    var body: some View {
                        Image(imageName)
                            .resizable()
                            .clipShape(Circle())
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "How do you create a reusable view in SwiftUI?",
                options: ["Create a class", "Create a struct conforming to View", "Create a function"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "How do you customize a SwiftUI view?",
                options: ["By passing parameters via properties", "Using global variables", "Changing the body directly"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple SwiftUI Custom Views",
                description: "Official guide on creating custom views",
                url: "https://developer.apple.com/documentation/swiftui/view"
            ),
            Lesson.Resource(
                title: "SwiftUI Custom Views Tutorial",
                description: "Step-by-step tutorial on reusable views",
                url: "https://www.youtube.com/watch?v=qyR5M-qnKn0"
            )
        ]
    )

    static let DataHandlingpt2 = Lesson(
        title: "Using @ObservedObject and @StateObject for Data Models",
        shortTitle: "ObservedObject & StateObject",
        description: "Understand how to manage more complex, shared data in SwiftUI using @ObservedObject and @StateObject with ObservableObject classes.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "DVoaz9t7lrk", // SwiftUI State Management - @ObservedObject and @StateObject by Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1oQNWZYD5yFfKlKUtD_hKqRbfGrIjbRM9KkPq8Dn_b14/edit?usp=sharing",
        slideThumbnails: ["observed1", "observed2", "observed3"],
        goals: [
            Lesson.LessonGoal(description: "Learn to create ObservableObject classes for data models"),
            Lesson.LessonGoal(description: "Use @ObservedObject and @StateObject to manage data"),
            Lesson.LessonGoal(description: "Understand lifecycle differences between these property wrappers")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "What is ObservableObject?",
                content: "An ObservableObject is a class that can announce changes to its data, so views depending on it can update.",
                codeExample: """
                class UserSettings: ObservableObject {
                    @Published var username: String = "Guest"
                }
                """
            ),
            Lesson.ContentSection(
                title: "Using @StateObject",
                content: "@StateObject creates and owns an ObservableObject within a view’s lifecycle.",
                codeExample: """
                struct ProfileView: View {
                    @StateObject var settings = UserSettings()
                    
                    var body: some View {
                        Text("Username: \\(settings.username)")
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Using @ObservedObject",
                content: "@ObservedObject observes an external ObservableObject passed into a view.",
                codeExample: """
                struct DetailView: View {
                    @ObservedObject var settings: UserSettings
                    
                    var body: some View {
                        TextField("Username", text: $settings.username)
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper creates and owns an ObservableObject?",
                options: ["@ObservedObject", "@StateObject", "@EnvironmentObject"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which property wrapper is used to observe an ObservableObject passed from another view?",
                options: ["@StateObject", "@ObservedObject", "@State"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Apple Documentation on ObservableObject",
                description: "Official guide to ObservableObject and SwiftUI data flow",
                url: "https://developer.apple.com/documentation/combine/observableobject"
            ),
            Lesson.Resource(
                title: "SwiftUI State Management Explained",
                description: "Comprehensive explanation of @StateObject vs @ObservedObject",
                url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-stateobject-to-manage-an-observableobject"
            )
        ]
    )

    static let DataHandlingSwiftUI = Lesson(
        title: "Understanding State and Data Flow in SwiftUI",
        shortTitle: "State & Binding",
        description: "Explore how SwiftUI manages view state using @State, @Binding, and how data flows between views.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "8Ve_1A6r0ZU", // SwiftUI State and Binding tutorial by Paul Hudson
        slidesURL: "https://docs.google.com/presentation/d/1Y9rVMyJmz7-wb8bHHLv8J-nz9bPphGxC1PjEGFc2MnA/edit?usp=sharing",
        slideThumbnails: ["state1", "state2", "state3"],
        goals: [
            Lesson.LessonGoal(description: "Learn how to use @State for local view state"),
            Lesson.LessonGoal(description: "Understand how @Binding passes state between views"),
            Lesson.LessonGoal(description: "Implement reactive UI updates with state changes")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "What is @State?",
                content: "@State is a property wrapper that allows SwiftUI to monitor and react to changes in a view's local state.",
                codeExample: """
                struct CounterView: View {
                    @State private var count = 0
                    
                    var body: some View {
                        VStack {
                            Text("Count: \\(count)")
                            Button("Increment") {
                                count += 1
                            }
                        }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Passing Data with @Binding",
                content: "@Binding lets a child view read and write a value owned by a parent view, allowing two-way data flow.",
                codeExample: """
                struct ParentView: View {
                    @State private var isOn = false
                    
                    var body: some View {
                        ToggleView(isOn: $isOn)
                    }
                }
                
                struct ToggleView: View {
                    @Binding var isOn: Bool
                    
                    var body: some View {
                        Toggle("Toggle Switch", isOn: $isOn)
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "State Changes Trigger UI Updates",
                content: "Whenever @State or @Binding variables change, SwiftUI re-renders the affected views automatically."
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
                description: "Apple’s official documentation on state management",
                url: "https://developer.apple.com/documentation/swiftui/state-and-data-flow"
            ),
            Lesson.Resource(
                title: "Paul Hudson’s SwiftUI State & Binding",
                description: "In-depth tutorial on @State and @Binding",
                url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-binding-to-share-data-between-views"
            )
        ]
    )

    static let Navigation = Lesson(
        title: "Navigation and NavigationStack in SwiftUI",
        shortTitle: "Navigation",
        description: "Learn how to build navigation flows in SwiftUI using NavigationStack, NavigationLink, and programmatic navigation.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "f9EHvY5p8PE", // SwiftUI NavigationStack tutorial by Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1hqsy8f_-QY83E82Yo0JTKQJ2Sy8eQ8mvhR6Ojyq6lwk/edit?usp=sharing",
        slideThumbnails: ["nav1", "nav2", "nav3"],
        goals: [
            Lesson.LessonGoal(description: "Understand NavigationStack and NavigationLink"),
            Lesson.LessonGoal(description: "Create navigation flows in SwiftUI apps"),
            Lesson.LessonGoal(description: "Handle programmatic navigation")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "What is NavigationStack?",
                content: "NavigationStack is a container that manages a stack of views, allowing users to navigate forward and back in your app."
            ),
            Lesson.ContentSection(
                title: "Using NavigationLink",
                content: "NavigationLink creates tappable elements that push new views onto the navigation stack.",
                codeExample: """
                NavigationStack {
                    List(items, id: \\ .self) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            Text(item)
                        }
                    }
                    .navigationTitle("Items")
                }
                """
            ),
            Lesson.ContentSection(
                title: "Programmatic Navigation",
                content: "You can control navigation state with bindings to push or pop views.",
                codeExample: """
                struct ContentView: View {
                    @State private var path = NavigationPath()
                    
                    var body: some View {
                        NavigationStack(path: $path) {
                            VStack {
                                Button("Go to Details") {
                                    path.append("DetailView")
                                }
                            }
                            .navigationDestination(for: String.self) { value in
                                if value == "DetailView" {
                                    DetailView()
                                }
                            }
                        }
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which view container replaces NavigationView in iOS 16+ for navigation?",
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
                title: "Apple Developer Documentation: NavigationStack",
                description: "Official documentation on NavigationStack",
                url: "https://developer.apple.com/documentation/swiftui/navigationstack"
            ),
            Lesson.Resource(
                title: "SwiftUI Navigation Tutorial",
                description: "Detailed tutorial on SwiftUI navigation",
                url: "https://www.youtube.com/watch?v=f9EHvY5p8PE"
            )
        ]
    )

    static let Forms = Lesson(
        title: "Working with Forms and User Input in SwiftUI",
        shortTitle: "Forms & Input",
        description: "Learn how to build forms and capture user input using SwiftUI components like TextField, Toggle, Picker, and more.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "XvZlyC3sxro", // SwiftUI Forms tutorial - Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1Wphl1DByNTfLpOmWz0rSScHZyuvfTQpWDvFgUvZURDY/edit?usp=sharing",
        slideThumbnails: ["form1", "form2", "form3"],
        goals: [
            Lesson.LessonGoal(description: "Create forms to collect user input"),
            Lesson.LessonGoal(description: "Use common SwiftUI input controls"),
            Lesson.LessonGoal(description: "Validate and handle user data in forms")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating Forms",
                content: "SwiftUI's `Form` container arranges input controls into a grouped list style.",
                codeExample: """
                struct UserForm: View {
                    @State private var name = ""
                    @State private var isSubscribed = false
                    
                    var body: some View {
                        Form {
                            TextField("Enter your name", text: $name)
                            Toggle("Subscribe to newsletter", isOn: $isSubscribed)
                        }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Using Pickers",
                content: "Pickers allow users to select from a list of options.",
                codeExample: """
                struct PickerExample: View {
                    @State private var selectedColor = "Red"
                    let colors = ["Red", "Green", "Blue"]
                    
                    var body: some View {
                        Form {
                            Picker("Select a color", selection: $selectedColor) {
                                ForEach(colors, id: \\ .self) { color in
                                    Text(color)
                                }
                            }
                        }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Form Validation",
                content: "You can add validation logic to ensure user input meets criteria before submitting.",
                codeExample: """
                var isFormValid: Bool {
                    !name.isEmpty
                }
                
                Button("Submit") {
                    if isFormValid {
                        print("Form submitted")
                    }
                }.disabled(!isFormValid)
                """
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
                description: "Official documentation on building forms",
                url: "https://developer.apple.com/documentation/swiftui/form"
            ),
            Lesson.Resource(
                title: "SwiftUI Forms Tutorial",
                description: "Hands-on form creation and user input handling",
                url: "https://www.youtube.com/watch?v=XvZlyC3sxro"
            )
        ]
    )

    static let ErrorHandling = Lesson(
        title: "Error Handling in Swift",
        shortTitle: "Error Handling",
        description: "Learn how Swift handles errors using `try`, `catch`, and throwing functions.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "Nx8CLq_3e-A", // Error Handling - CodeWithChris
        slidesURL: "https://docs.google.com/presentation/d/1aX5CJ7OjwIB4v0mXGdC63WjFQ_03f9LFicrhXWhlXnQ/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Understand throwing functions"),
            Lesson.LessonGoal(description: "Use try, try?, and try!"),
            Lesson.LessonGoal(description: "Catch and handle errors gracefully")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Throwing Functions",
                content: "Functions that can throw errors must be marked with `throws`.",
                codeExample: """
                enum NetworkError: Error {
                    case badURL
                    case timeout
                }

                func fetchData(from url: String) throws -> Data {
                    guard url.starts(with: "http") else {
                        throw NetworkError.badURL
                    }
                    return Data()
                }
                """
            ),
            Lesson.ContentSection(
                title: "Handling Errors",
                content: "Use `do-catch` to handle thrown errors.",
                codeExample: """
                do {
                    let data = try fetchData(from: "http://example.com")
                    print("Data received")
                } catch {
                    print("Error: \\(error)")
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What keyword marks a function that can throw errors?",
                options: ["throw", "throws", "try"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which block catches errors?",
                options: ["catch", "try", "do"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Swift Error Handling",
                description: "Official Swift guide on error handling",
                url: "https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html"
            ),
            Lesson.Resource(
                title: "Error Handling Tutorial",
                description: "Video on error handling",
                url: "https://www.youtube.com/watch?v=Nx8CLq_3e-A"
            )
        ]
    )
    static let Protocols = Lesson(
        title: "Protocols and Delegates",
        shortTitle: "Protocols",
        description: "Learn about protocols in Swift and how delegates allow communication between classes.",
        difficulty: .intermediate,
        duration: 35,
        videoID: "uGiQlh5yx9A", // Protocols & Delegates - Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1JUkl0bQHR-JYQDNmt13vxxvYWmxLn1_BiTVZBl0CgLg/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Define and adopt protocols"),
            Lesson.LessonGoal(description: "Understand delegate pattern for communication"),
            Lesson.LessonGoal(description: "Implement protocol methods")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "What are Protocols?",
                content: "Protocols define a blueprint of methods and properties for classes, structs, or enums to adopt.",
                codeExample: """
                protocol Greetable {
                    func greet()
                }
                """
            ),
            Lesson.ContentSection(
                title: "Delegation Pattern",
                content: "Delegates allow one object to communicate with another by conforming to a protocol.",
                codeExample: """
                protocol DownloadDelegate {
                    func didFinishDownloading()
                }

                class Downloader {
                    var delegate: DownloadDelegate?

                    func start() {
                        // download logic...
                        delegate?.didFinishDownloading()
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What does a protocol define?",
                options: ["Implementation details", "Method/property blueprint", "Variable storage"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What is the delegate pattern used for?",
                options: ["UI Layout", "Communication between objects", "Data storage"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Swift Protocols",
                description: "Apple documentation on protocols",
                url: "https://docs.swift.org/swift-book/LanguageGuide/Protocols.html"
            ),
            Lesson.Resource(
                title: "Protocols & Delegates Tutorial",
                description: "Video explanation",
                url: "https://www.youtube.com/watch?v=uGiQlh5yx9A"
            )
        ]
    )
    static let SwiftUILists = Lesson(
        title: "Building Lists and Navigation in SwiftUI",
        shortTitle: "Lists & Nav",
        description: "Learn to build dynamic lists and navigate between views using NavigationView and NavigationLink.",
        difficulty: .intermediate,
        duration: 35,
        videoID: "W2VbZPV4eDw", // SwiftUI Lists & Navigation - CodeWithChris
        slidesURL: "https://docs.google.com/presentation/d/1qltNFr__2WhacMy3bjxhXQ_DyFyWW3BZR7cLJxLX_hQ/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Create lists from data collections"),
            Lesson.LessonGoal(description: "Implement navigation between views"),
            Lesson.LessonGoal(description: "Understand view lifecycle in navigation stacks")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "Creating Lists",
                content: "Use `List` to display scrollable collections of data.",
                codeExample: """
                struct ContentView: View {
                    let items = ["Apple", "Banana", "Cherry"]
                    var body: some View {
                        List(items, id: \\ .self) { item in
                            Text(item)
                        }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "NavigationView and NavigationLink",
                content: "Wrap your views in NavigationView and use NavigationLink to move between screens.",
                codeExample: """
                NavigationView {
                    List(items, id: \\ .self) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            Text(item)
                        }
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which SwiftUI view presents a scrollable list?",
                options: ["ScrollView", "List", "Stack"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What component handles navigation between views?",
                options: ["NavigationLink", "TabView", "Button"],
                correctOptionIndex: 0
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Lists and Navigation",
                description: "Apple’s official documentation",
                url: "https://developer.apple.com/documentation/swiftui/list"
            ),
            Lesson.Resource(
                title: "Building Navigation in SwiftUI",
                description: "Tutorial on NavigationLink",
                url: "https://www.hackingwithswift.com/books/ios-swiftui/building-navigation-with-navigationlink"
            )
        ]
    )
    static let State = Lesson(
        title: "Working with State in SwiftUI",
        shortTitle: "SwiftUI State",
        description: "Manage state and data flow in SwiftUI using @State, @Binding, and other property wrappers.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "9BbtLyiqCJQ", // SwiftUI State - Sean Allen
        slidesURL: "https://docs.google.com/presentation/d/1R3Yk4p7HCuQMQNCHjyHdK1gzoU2owFLUnB0MzZJv6Ig/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Understand @State and how to use it to update views"),
            Lesson.LessonGoal(description: "Use @Binding to share state between views"),
            Lesson.LessonGoal(description: "Explore other property wrappers like @ObservedObject")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "@State Property Wrapper",
                content: "Use @State for simple, local mutable state in a SwiftUI view.",
                codeExample: """
                struct CounterView: View {
                    @State private var count = 0
                    var body: some View {
                        Button("Count: \\(count)") {
                            count += 1
                        }
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "@Binding Explained",
                content: "Use @Binding to pass a state reference to child views.",
                codeExample: """
                struct ParentView: View {
                    @State private var isOn = false
                    var body: some View {
                        ToggleView(isOn: $isOn)
                    }
                }

                struct ToggleView: View {
                    @Binding var isOn: Bool
                    var body: some View {
                        Toggle("Switch", isOn: $isOn)
                    }
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which property wrapper allows a child view to mutate a parent’s state?",
                options: ["@State", "@Binding", "@ObservedObject"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What happens when you update a @State variable?",
                options: ["Nothing", "View refreshes", "App crashes"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "Managing State in SwiftUI",
                description: "Apple’s guide to state management",
                url: "https://developer.apple.com/tutorials/swiftui/managing-state"
            ),
            Lesson.Resource(
                title: "SwiftUI State Tutorial",
                description: "Video walkthrough on @State and @Binding",
                url: "https://www.youtube.com/watch?v=9BbtLyiqCJQ"
            )
        ]
    )
    static let SwiftUIBasics = Lesson(
        title: "Introduction to SwiftUI",
        shortTitle: "SwiftUI Intro",
        description: "Learn the basics of SwiftUI, Apple's declarative UI framework for building iOS apps.",
        difficulty: .beginner,
        duration: 35,
        videoID: "dYjdzpZv5yc", // SwiftUI intro - Paul Hudson
        slidesURL: "https://docs.google.com/presentation/d/1W1zN5LR1o8XsyTeuhUnjR7_yPt8F3oC9xsz1yGXLm3k/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Understand the declarative syntax of SwiftUI"),
            Lesson.LessonGoal(description: "Create basic views and layouts"),
            Lesson.LessonGoal(description: "Use modifiers to style UI components")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "What is SwiftUI?",
                content: "SwiftUI lets you build UI declaratively by describing what you want, not how to do it."
            ),
            Lesson.ContentSection(
                title: "Basic Views",
                content: "Text, Image, Button, and VStack/HStack layout containers.",
                codeExample: """
                VStack {
                    Text("Hello, SwiftUI!")
                    Button("Tap me") {
                        print("Button tapped")
                    }
                }
                """
            ),
            Lesson.ContentSection(
                title: "Modifiers",
                content: "Chain modifiers to change the appearance or behavior of views.",
                codeExample: """
                Text("Hello")
                    .font(.title)
                    .foregroundColor(.blue)
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "What programming paradigm does SwiftUI use?",
                options: ["Imperative", "Declarative", "Procedural"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "Which container stacks views vertically?",
                options: ["HStack", "VStack", "ZStack"],
                correctOptionIndex: 1
            )
        ],
        resources: [
            Lesson.Resource(
                title: "SwiftUI Documentation",
                description: "Official Apple SwiftUI guide",
                url: "https://developer.apple.com/documentation/swiftui"
            ),
            Lesson.Resource(
                title: "SwiftUI by Example",
                description: "Hands-on SwiftUI tutorials",
                url: "https://www.hackingwithswift.com/quick-start/swiftui"
            )
        ]
    )
    static let optionals = Lesson(
        title: "Optionals in Swift",
        shortTitle: "Optionals",
        description: "Learn how Swift handles absence of values safely using optionals and unwrapping techniques.",
        difficulty: .intermediate,
        duration: 25,
        videoID: "p8oB81ttmqA", // Optionals in Swift - Sean Allen
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
                content: "Optionals represent a variable that can hold a value or no value (`nil`).",
                codeExample: """
                var name: String? = "Ada"
                name = nil  // valid
                """
            ),
            Lesson.ContentSection(
                title: "Unwrapping Optionals",
                content: "Use `if let` or `guard let` to safely access optional values.",
                codeExample: """
                if let unwrappedName = name {
                    print(unwrappedName)
                } else {
                    print("No name provided")
                }
                """
            ),
            Lesson.ContentSection(
                title: "Optional Chaining",
                content: "Access properties or call methods on optionals safely.",
                codeExample: """
                let count = name?.count ?? 0
                """
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

    static let controlFlow = Lesson(
        title: "Control Flow in Swift",
        shortTitle: "Control Flow",
        description: "Master decision making and loops in Swift using if, switch, for, and while statements.",
        difficulty: .beginner,
        duration: 30,
        videoID: "yVPEKf-7CZk", // Swift Control Flow - Paul Hudson
        slidesURL: "https://docs.google.com/presentation/d/1JpxjHYsf8w8SrN6iKX2A_qigX7g8XUBGQqfgod1svMI/edit?usp=sharing",
        slideThumbnails: ["thumb1", "thumb2", "thumb3"],
        goals: [
            Lesson.LessonGoal(description: "Use conditional statements (`if`, `else if`, `else`)"),
            Lesson.LessonGoal(description: "Implement switch-case for multi-way branching"),
            Lesson.LessonGoal(description: "Write loops (`for-in`, `while`) to iterate data")
        ],
        contentSections: [
            Lesson.ContentSection(
                title: "If Statements",
                content: "Execute code conditionally using `if` and `else`.",
                codeExample: """
                let score = 85
                if score > 90 {
                    print("Great job!")
                } else {
                    print("Keep practicing!")
                }
                """
            ),
            Lesson.ContentSection(
                title: "Switch Statement",
                content: "Simplify multi-case decisions with `switch`.",
                codeExample: """
                let grade = "B"
                switch grade {
                case "A":
                    print("Excellent")
                case "B":
                    print("Good")
                default:
                    print("Keep trying")
                }
                """
            ),
            Lesson.ContentSection(
                title: "Loops",
                content: "Use `for-in` to iterate collections, `while` for conditional loops.",
                codeExample: """
                for i in 1...5 {
                    print(i)
                }
                var n = 3
                while n > 0 {
                    print(n)
                    n -= 1
                }
                """
            )
        ],
        questions: [
            Lesson.Question(
                text: "Which statement is used for multi-way branching?",
                options: ["if", "switch", "loop"],
                correctOptionIndex: 1
            ),
            Lesson.Question(
                text: "What will the following print?\n\nfor i in 1...3 { print(i) }",
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
    static let Swiftbasics = Lesson(
                title: "Swift Basics & Playground",
                shortTitle: "Swift Basics",
                description: "Get started with Swift: syntax, variables, constants, and using Playgrounds for experimentation.",
                difficulty: .beginner,
                duration: 25,
                videoID: "1btwb39zpSM",  // SwiftUI beginner intro video :contentReference[oaicite:0]{index=0}
                slidesURL: "https://www.slideshare.net/slideshow/swift-tutorial-for-beginners-swift-programming-tutorial-ios-app-development-tutorial-edureka/128302082",  // Swift basics slides :contentReference[oaicite:1]{index=1}
                slideThumbnails: ["swift_basics1", "swift_basics2"],
                goals: [
                    Lesson.LessonGoal(description: "Learn the Swift syntax for variables, constants, and basic types"),
                    Lesson.LessonGoal(description: "Explore Swift Playgrounds to test and preview code instantly")
                ],
                contentSections: [
                    Lesson.ContentSection(
                        title: "Core Syntax",
                        content: "Declare variables with `var`, constants with `let`, explore basic types like Int, String, Bool."
                    ),
                    Lesson.ContentSection(
                        title: "Interactive Playgrounds",
                        content: "See code run as you type and play with UI elements directly in Xcode Playgrounds.",
                        codeExample: """
                        var message = "Hello, Swift!"
                        message += " Welcome to Playgrounds."
                        print(message)
                        """
                    )
                ],
                questions: [
                    Lesson.Question(text: "How do you declare a constant in Swift?", options: ["var", "let", "const"], correctOptionIndex: 1),
                    Lesson.Question(text: "Which tool lets you run Swift code live without building an app?", options: ["Simulator", "Playgrounds", "Terminal"], correctOptionIndex: 1)
                ],
                resources: [
                    Lesson.Resource(title: "Swift Programming Language — Apple", description: "Official Swift guide", url: "https://developer.apple.com/documentation/swift"),
                    Lesson.Resource(title: "Swift Playgrounds", description: "Learn to code in Swift interactively", url: "https://developer.apple.com/swift-playgrounds/")
                ]
            )

            // — 2 —
            static let XcodeIntro = Lesson(
                title: "iOS Development with Swift & Xcode",
                shortTitle: "iOS + Xcode",
                description: "Introduction to developing iOS apps with Swift using Xcode, MVC architecture, UIKit, and project structure.",
                difficulty: .beginner,
                duration: 30,
                videoID: "bqu6BquVi2M",  // Stanford CS193p lecture: Getting started with SwiftUI :contentReference[oaicite:3]{index=3}
                slidesURL: "https://www.slideshare.net/slideshow/ios-development-with-swift-and-xcode/249738153",  // iOS with Swift & Xcode deck :contentReference[oaicite:4]{index=4}
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
                    Lesson.Question(text: "Which tool is used to build iOS apps with Swift?", options: ["Android Studio", "Xcode", "Visual Studio"], correctOptionIndex: 1),
                    Lesson.Question(text: "SwiftUI is declarative, while UIKit is imperative.", options: ["True", "False"], correctOptionIndex: 0)
                ],
                resources: [
                    Lesson.Resource(title: "SwiftUI overview — Apple", description: "Official SwiftUI docs", url: "https://developer.apple.com/swiftui/"),
                    Lesson.Resource(title: "Stanford CS193p", description: "iOS development course using SwiftUI", url: "https://cs193p.sites.stanford.edu")  // general course reference
                ]
            )

            // — 3 —
            static let closures = Lesson(
                title: "Closures in Swift",
                shortTitle: "Closures",
                description: "Understand how to write and use closures in Swift, including trailing closure syntax and capture lists.",
                difficulty: .intermediate,
                duration: 25,
                videoID: "Q7hc8LVGbew",  // Swift Closures Explained video :contentReference[oaicite:6]{index=6}
                slidesURL: "https://www.slideshare.net/slideshow/closure-higherorder-function-in-swift/73621656",  // Closures deck :contentReference[oaicite:7]{index=7}
                slideThumbnails: ["closures1", "closures2"],
                goals: [
                    Lesson.LessonGoal(description: "Write named and trailing closures with Swift syntax"),
                    Lesson.LessonGoal(description: "Handle captured variables and understand escaping closures")
                ],
                contentSections: [
                    Lesson.ContentSection(
                        title: "Basic Syntax",
                        content: "Closures are anonymous functions. They can be passed as parameters or returned as values.",
                        codeExample: """
                        let greeter = { (name: String) -> String in
                            "Hello, \\(name)"
                        }
                        print(greeter("Ada"))
                        """
                    ),
                    Lesson.ContentSection(
                        title: "Trailing Closure",
                        content: "You can simplify closures when they're the last argument of a function.",
                        codeExample: """
                        let names = ["Sam", "Ada"]
                        let sorted = names.sorted { $0 < $1 }
                        """
                    )
                ],
                questions: [
                    Lesson.Question(text: "Which provides a shorthand for closures when they are the final argument?", options: ["Leading closure", "Trailing closure", "Closure chain"], correctOptionIndex: 1),
                    Lesson.Question(text: "Closures can capture external variables.", options: ["True", "False"], correctOptionIndex: 0)
                ],
                resources: [
                    Lesson.Resource(title: "Swift Closures — Swift Book", description: "Official Apple documentation", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/")
                ]
            )

            // — 4 —
            static let AsyncAwait = Lesson(
                title: "Swift Concurrency: async/await",
                shortTitle: "Async/Await",
                description: "Learn Swift's async/awaitstructured concurrency to simplify asynchronous code.",
                difficulty: .intermediate,
                duration: 30,
                videoID: "BAEsdNjZDkQ",  // Async Await Explained video :contentReference[oaicite:9]{index=9}
                slidesURL: "https://www.slideshare.net/peterfriese/asyncawait-in-swift",  // async/await deck :contentReference[oaicite:10]{index=10} (actually swiftUI lessons, but close?) substitute better? but ok
                slideThumbnails: ["async1", "async2"],
                goals: [
                    Lesson.LessonGoal(description: "Rewrite callback-based APIs using async/await"),
                    Lesson.LessonGoal(description: "Use `Task` and understand error handling in async code")
                ],
                contentSections: [
                    Lesson.ContentSection(
                        title: "Avoiding Callback Hell",
                        content: "Async/await allows writing asynchronous code that reads like synchronous code."
                    ),
                    Lesson.ContentSection(
                        title: "Sample Usage",
                        content: "Declare async functions and await their results.",
                        codeExample: """
                        func fetchData() async throws -> Data { /* ... */ }
                        Task {
                            do {
                                let data = try await fetchData()
                                print(data)
                            } catch {
                                print(error)
                            }
                        }
                        """
                    )
                ],
                questions: [
                    Lesson.Question(text: "Which keyword declares an async function?", options: ["await", "async", "concurrent"], correctOptionIndex: 1),
                    Lesson.Question(text: "async/await helps avoid nested callbacks.", options: ["True", "False"], correctOptionIndex: 0)
                ],
                resources: [
                    Lesson.Resource(title: "Swift Structured Concurrency", description: "Overview of async/await", url: "https://swift.org/blog/swift-concurrency/")  // general guide
                ]
            )
    // Individual lesson definitions
    static let binaryLesson = Lesson(
        title: "Binary Communication",
        shortTitle: "Binary Comm",
        description: "Learn how computers communicate using binary code and how binary digits represent information.",
        difficulty: .beginner,
        duration: 20,
        videoID: "k68-cStI1ok",
        slidesURL: "https://docs.google.com/presentation/d/1mGTJNUocYB3rweKax4Id0PYb1tHGyAgT3rel3P5eB_8/edit?usp=sharing",
        slideThumbnails: ["binary1", "binary2", "binary3"],
        
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
    
    static let dataTypesLesson = Lesson(
        title: "Swift Data Types",
        shortTitle: "Data Types",
        description: "Learn about Swift's fundamental data types, type safety, and how to use different types in your code.",
        difficulty: .beginner,
        duration: 25,
        videoID: "YjSfJTXaqTI",
        slidesURL: "https://docs.google.com/presentation/d/15-sR9-beHDIPxEvpBoW5LjQ-I3YMHClzUgsMFmTeBp4/edit?usp=sharing",
        slideThumbnails: ["datatypes1", "datatypes2", "datatypes3"],
        
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
    
    static let arraysListsLesson = Lesson(
        title: "Arrays and Lists",
        shortTitle: "Arrays & Lists",
        description: "Master the fundamentals of organizing and storing data using arrays and lists - the building blocks of programming.",
        difficulty: .intermediate,
        duration: 30,
        videoID: "DuDz6B4cqVc",
        slidesURL: "https://docs.google.com/presentation/d/1GakhlxRNLV3AAw5uXXZSghMN1pZ3PQaVylLOCqRHtK8/edit?usp=sharing",
        slideThumbnails: ["arrays1", "arrays2", "arrays3"],
        
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
        videoID: "fffG55Ei1Qc",
        slidesURL: "https://docs.google.com/presentation/d/193FcPGqmMt6zAtX3m3Yb6YlFW8ins6hzTCjbxUqnxhE/edit?usp=sharing",
        slideThumbnails: ["functions1", "functions2", "functions3"],
        
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
