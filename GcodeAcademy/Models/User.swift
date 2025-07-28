import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var lessonsCompleted: Int = 0
}
