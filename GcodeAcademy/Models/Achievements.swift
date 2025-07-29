import Foundation

struct Achievement: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var icon: String
    var unlocked: Bool = false
}
