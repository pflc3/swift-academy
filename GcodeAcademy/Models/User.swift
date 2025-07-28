import Foundation

struct User: Identifiable {
    var id = UUID() // Universally unique identifier
    var name: String
    var bio: String = "Gcode Academy Student"
    var lessonsCompleted: Int = 0
    var totalLessons: Int = 7
}
