import Foundation

struct Lesson: Identifiable, Equatable {
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var title: String
    var shortTitle: String
    var description: String
    
    // Metadata
    var difficulty: Difficulty
    var duration: Int = 20
    
    // External content
    var videoID: String? = nil
    var slidesURL: String? = nil
    var slideThumbnails: [String] = []
    
    // Content
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

// Using cases prevent typos and allow sorting/filtering
enum Difficulty: String, CaseIterable, Codable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    case challenging = "Challenging"
}
