// Lesson and related content types.
// Defines lesson metadata, content sections, questions, resources, and difficulty.
// Primary model used by the learning paths and lesson detail screens.

import Foundation

/// Core lesson model used by learning paths and lesson detail screens.
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
    /// A high-level learning objective for the lesson.
    struct LessonGoal: Identifiable {
        var id = UUID()
        var description: String
    }

    /// A content block in the lesson, optionally containing a code example.
    struct ContentSection: Identifiable {
        var id = UUID()
        var title: String
        var content: String
        var codeExample: String?
    }

    /// Basic multiple-choice question for lesson quizzes.
    struct Question: Identifiable {
        var id = UUID()
        var text: String
        var options: [String]
        var correctOptionIndex: Int
    }

    /// External resource referenced by the lesson (link + description).
    struct Resource: Identifiable {
        var id = UUID()
        var title: String
        var description: String
        var url: String
    }
}

/// Represents the difficulty of a lesson for filtering and display.
enum Difficulty: String, CaseIterable, Codable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    case challenging = "Challenging"
}
