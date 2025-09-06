import Foundation
import Combine

class User: ObservableObject, Identifiable {
    // Identity
    let id = UUID() // local UI id
    var uid: String // Firebase Auth UID
    
    // Authentication fields
    @Published var email: String
    
    // Profile information
    @Published var name: String
    @Published var bio: String
    
    // Progress tracking
    @Published var lessonsCompleted: Int
    @Published var achievements: [Achievement]
    
    init(uid: String,
         name: String,
         email: String,
         bio: String = "Swift Academy Student",
         lessonsCompleted: Int = 0,
         achievements: [Achievement] = []) {
        self.uid = uid
        self.name = name
        self.email = email
        self.bio = bio
        self.lessonsCompleted = lessonsCompleted
        self.achievements = achievements
    }
    
    // Progress management
    func addLesson() {
        self.lessonsCompleted += 1
    }
    
    // Generates initials from the user's name
    var initials: String {
        // Split the name into components using spaces
        let components = name.components(separatedBy: " ")
        
        if components.count >= 2 {
            // If we have two name, take first letter from each
            let first = components[0].prefix(1)
            let last = components[1].prefix(1)
            return "\(first)\(last)"
        } else if let first = name.first {
            // If we have one name, take the first letter
            return String(first)
        } else {
            // Fallback if name is empty
            return "?"
        }
    }
    
    // Calculates completion percentage as a value between 0.0 and 1.0
    var progressPercentage: Double {
        guard LessonData.allLessons.count > 0 else { return 0.0 }
        return Double(lessonsCompleted) / Double(LessonData.allLessons.count)
    }
    
    // Computed property for total lessons
    var totalLessons: Int {
        return LessonData.allLessons.count
    }
}
