import Foundation

struct User: Identifiable {
    var id = UUID() // Universally unique identifier
    var name: String
    var bio: String = "Gcode Academy Student"
    var lessonsCompleted: Int = 0
    var totalLessons: Int = 7
    var achievements: [Achievement] = [] // Achievement array
    
    // Generates intials from the user's name/
    var initials: String {
        // Split the name into components using spaces
        let components = name.components(separatedBy: " ")
        
        if components.count >= 2 {
            // If we have two name, take first letter from each
            let first = components[0].prefix(1)
            let last = components[1].prefix(1)
            return "/(first)/(last)"
        } else if let first = name.first {
            //if we have one name, take the first letter
            return String(first)
        } else {
            // Fallback if name is empty
            return "?"
        }
    }
    
    // Calucates completion percentage as a value between 0.0 and 1.0
    var progressPercentage: Double {
        //Avoid division by zero
        if totalLessons == 0 {
            return 0.0
        }
        
        // Calculate the percentage
        return Double(lessonsCompleted) / Double(totalLessons)
    }
}
