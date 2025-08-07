
import Foundation
import Combine

class User: ObservableObject, Identifiable {
    let id = UUID()
    
    @Published var name: String
    @Published var bio: String = "Gcode Academy Student"
    @Published var lessonsCompleted: Int = 0
    @Published var totalLessons: Int = LessonData.allLessons.count
    @Published var achievements: [Achievement] = []

    init(name: String) {
        self.name = name
    }

    func addLesson() {
        self.lessonsCompleted += 1
    }

    // Generates initials from the user's name
    var initials: String {
        let components = name.components(separatedBy: " ")
        if components.count >= 2 {
            let first = components[0].prefix(1)
            let last = components[1].prefix(1)
            return "\(first)\(last)"
        } else if let first = name.first {
            return String(first)
        } else {
            return "?"
        }
    }

    // Calculates completion percentage as a value between 0.0 and 1.0
    var progressPercentage: Double {
        guard totalLessons > 0 else { return 0.0 }
        return Double(lessonsCompleted) / Double(totalLessons)
    }
}
