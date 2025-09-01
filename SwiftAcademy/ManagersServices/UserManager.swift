import Foundation
import Combine

class UserManager: ObservableObject {
    // The current authenticated user
    @Published var currentUser: User?
    @Published var isAuthenticated: Bool = false
    
    // Login with credentials
    func login(email: String, password: String) -> Bool {
        // Find user in our mock database
        if let foundUser = MockData.users.first(where: {
            $0.email.lowercased() == email.lowercased() &&
            $0.password == password
        }) {
            // Use the existing user directly
            currentUser = foundUser
            isAuthenticated = true
            return true
        }
        return false
    }
    
    // Create a new user
    func signup(name: String, email: String, password: String) -> Bool {
        // Check if email already exists
        if MockData.users.contains(where: { $0.email.lowercased() == email.lowercased() }) {
            return false
        }
        
        // Create new user with default achievements
        let newUser = User(
            name: name,
            email: email,
            password: password,
            bio: "Swift Academy Student",
            lessonsCompleted: 0,
            achievements: MockData.achievements
        )
        
        // Add to our mock database
        MockData.users.append(newUser)
        
        // Set as current user
        currentUser = newUser
        isAuthenticated = true
        
        return true
    }
    
    // Logout current user
    func logout() {
        currentUser = nil
        isAuthenticated = false
    }
}
