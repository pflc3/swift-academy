import Foundation

struct Lesson: Identifiable, Equatable {
    static func == (lhs: Lesson, rhs: Lesson) -> Bool { lhs.id == rhs.id }
    var id = UUID()
    var title: String
    var shortTitle: String
    var description: String
    var difficulty: Difficulty
    var duration: Int = 20
    var videoID: String?
    var slidesURL: String?
    var slideThumbnails: [String] = []
    var goals: [LessonGoal] = []
    var contentSections: [ContentSection] = []
    var questions: [Question] = []
    var resources: [Resource] = []
}

extension Lesson {
    struct LessonGoal: Identifiable {
        var id = UUID()
        var description: String
    }
    struct ContentSection: Identifiable {
        var id = UUID()
        var title: String
        var content: String
        var codeExample: String?
    }
    struct Question: Identifiable {
        var id = UUID()
        var text: String
        var options: [String]
        var correctOptionIndex: Int
    }
    struct Resource: Identifiable {
        var id = UUID()
        var title: String
        var description: String
        var url: String
    }
}

enum Difficulty: String, CaseIterable, Codable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    case challenging = "Challenging"
}
