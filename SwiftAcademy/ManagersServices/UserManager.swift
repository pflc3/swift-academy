import Foundation
import FirebaseAuth

class UserManager: ObservableObject {
    // The current authenticated user
    @Published var currentUser: User?
    @Published var isAuthenticated: Bool = false
    
    // Signup with Firebase
    func signup(name: String, email: String, password: String, confirmPassword: String,
                completion: @escaping (Bool, String?) -> Void) {
        guard password == confirmPassword else {
            completion(false, "Passwords do not match")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            
            guard let user = result?.user else {
                completion(false, "No user returned")
                return
            }
            
            // Create local User model (no Firestore for now)
            self.currentUser = User(
                uid: user.uid,
                name: name,
                email: email,
                password: password, // normally you wouldn't keep this!
                bio: "Swift Academy Student"
            )
            self.isAuthenticated = true
            completion(true, nil)
        }
    }
    
    // Login with Firebase
    func login(email: String, password: String,
               completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            
            guard let user = result?.user else {
                completion(false, "No user returned")
                return
            }
            
            // For now we don’t have Firestore, so just make a temp User
            self.currentUser = User(
                uid: user.uid,
                name: "Student", // placeholder until we load profile later
                email: email,
                password: password
            )
            self.isAuthenticated = true
            completion(true, nil)
        }
    }
    
    // Logout
    func logout() {
        do {
            try Auth.auth().signOut()
            currentUser = nil
            isAuthenticated = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
