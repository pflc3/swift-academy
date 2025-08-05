import Foundation

struct Lesson: Identifiable {
    var id = UUID()
    var title: String
    var shortTitle: String
    var description: String
    
    // Metadata
    var difficulty: String = "Beginner"
    var duration: Int = 20
    
    // Content
    var videoID: String? = nil
    var slidesURL: String? = nil
    var goals: [LessonGoal] = []
    var contentSections: [ContentSection] = []
    var questions: [Question] = []
    var resources: [Resource] = []
}

// Supporting models for lesson content
extension Lesson {
    struct LessonGoal: Identifiable {
        var id = UUID()
        var description: String
    }
    
    struct ContentSection: Identifiable {
        var id = UUID()
        var title: String
        var content: String
        var codeExample: String? = nil // Optional code snippet
    }

    struct Question: Identifiable {
        var id = UUID()
        var text: String
        var options: [String]
        var correctOptionIndex: Int  // Index of correct answer
    }

    struct Resource: Identifiable {
        var id = UUID()
        var title: String
        var description: String
        var url: String
    }
}
