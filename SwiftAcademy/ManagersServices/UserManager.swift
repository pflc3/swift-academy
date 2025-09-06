import Foundation
import FirebaseAuth
import FirebaseFirestore

/*
 * Firebase API calls are asynchronous and can be long-running
 * async/await: Use with Firebase methods to write cleaner, sequential code
 *
 * @MainActor: Ensures that code updating the UI always runs on the main thread
 * Cucial as Firebase callbacks are not guaranteed to be on the main thread
 */
@MainActor
class UserManager: ObservableObject {
    // @Published: Automatically updates SwiftUI views whenever this property changes
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    @Published var currentToast: ToastMessage?

    // Firestore handle
    private let db = Firestore.firestore()
    private var authHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        observeAuthState()
    }
    
    deinit {
        if let h = authHandle { Auth.auth().removeStateDidChangeListener(h) }
    }
    
    private func observeAuthState() {
        authHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self else { return }
            Task { @MainActor in
                if let user = user {
                    // User is already signed in — fetch profile
                    do {
                        let snap = try await self.readFromUserDoc(uid: user.uid)
                        if let data = snap.data() {
                            self.currentUser = User(
                                uid: user.uid,
                                name: data["name"] as? String ?? "Student",
                                email: data["email"] as? String ?? "",
                                bio: data["bio"] as? String ?? "",
                                lessonsCompleted: data["lessonsCompleted"] as? Int ?? 0,
                                achievements: self.convertAchFirestoreToUser(data: data)
                            )
                            self.isAuthenticated = true
                        } else {
                            // No profile doc — treat as signed out or create a minimal user as you prefer
                            self.currentUser = nil
                            self.isAuthenticated = false
                        }
                    } catch {
                        // Failed to load profile, surface a toast and stay on auth screen
                        self.currentToast = ToastMessage("Couldn’t load profile", isPositive: false)
                        self.currentUser = nil
                        self.isAuthenticated = false
                    }
                } else {
                    // Signed out
                    self.currentUser = nil
                    self.isAuthenticated = false
                }
            }
        }
    }

    // Create Firebase Auth user, seed profile doc, update local model
    func signup(name: String, email: String, password: String, confirmPassword: String) async throws {
        guard password == confirmPassword else { throw AuthError.mismatchPasswords }

        // 1) Auth create
        let result = try await authCreateUser(email: email, password: password)
        let uid = result.user.uid

        // 2) Seed profile in Firestore
        let profile: [String: Any] = [
            "name": name,
            "email": email,
            "bio": "Swift Academy Student",
            "lessonsCompleted": 0,
            "achievements": MockData.defaultAchievementsFirestoreLocked()
        ]
        try await writeToUserDoc(uid: uid, data: profile)

        // 3) Reflect locally
        currentUser = User(
            uid: uid,
            name: name,
            email: email,
            achievements: MockData.defaultAchievements
        )
        isAuthenticated = true
    }

    // Sign in and load profile doc into local model
    func login(email: String, password: String) async throws {
        // 1) Auth sign-in
        let result = try await authSignIn(email: email, password: password)
        let uid = result.user.uid

        // 2) Fetch profile
        let snap = try await readFromUserDoc(uid: uid)
        guard let data = snap.data() else { throw AuthError.profileMissing }

        // 3) Map Firestore -> User
        currentUser = User(
            uid: uid,
            name: data["name"] as? String ?? "Student",
            email: data["email"] as? String ?? email,
            bio: data["bio"] as? String ?? "",
            lessonsCompleted: data["lessonsCompleted"] as? Int ?? 0,
            achievements: convertAchFirestoreToUser(data: data)
        )
        isAuthenticated = true
    }

    // Sign out and clear local state.
    func logout() throws {
        try Auth.auth().signOut()
        currentUser = nil
        isAuthenticated = false
    }
    
    // Update profile and write to Firebase
    func updateProfile(name: String, bio: String) async throws {
        guard let u = currentUser else { throw UserDataError.notLoggedIn }
        try await writeToUserDoc(uid: u.uid, data: ["name": name, "bio": bio], merge: true)
        // keep local state in sync
        u.name = name
        u.bio  = bio
    }
    
    // Update completed lessons and write to Firebase
    func markLessonCompletedIfNeeded(for lesson: Lesson) async {
        guard let u = currentUser else { return }
        guard let idx = LessonData.allLessons.firstIndex(of: lesson) else { return }

        // Only advance if this is the next lesson in sequence
        guard idx == u.lessonsCompleted else { return }

        let newCount = u.lessonsCompleted + 1
        do {
            try await writeToUserDoc(uid: u.uid, data: ["lessonsCompleted": newCount], merge: true)
            u.lessonsCompleted = newCount
            showToast("Lesson completed! 🎉", isPositive: true)
        } catch {
            showToast("Failed to update progress", isPositive: false)
            print("Failed to update lessonsCompleted: \(error.localizedDescription)")
        }
    }

    /* Firebase Auth async wrappers */

    private func authCreateUser(email: String, password: String) async throws -> AuthDataResult {
        try await withCheckedThrowingContinuation { continuation in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = result {
                    continuation.resume(returning: result)
                } else {
                    continuation.resume(throwing: AuthError.unknown)
                }
            }
        }
    }

    private func authSignIn(email: String, password: String) async throws -> AuthDataResult {
        try await withCheckedThrowingContinuation { continuation in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = result {
                    continuation.resume(returning: result)
                } else {
                    continuation.resume(throwing: AuthError.unknown)
                }
            }
        }
    }

    /* Firestore async wrappers */

    private func writeToUserDoc(uid: String, data: [String: Any], merge: Bool = false) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            db.collection("users").document(uid).setData(data, merge: merge) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }

    private func readFromUserDoc(uid: String) async throws -> DocumentSnapshot {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<DocumentSnapshot, Error>) in
            db.collection("users").document(uid).getDocument { snapshot, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let snapshot = snapshot {
                    continuation.resume(returning: snapshot)
                } else {
                    continuation.resume(throwing: AuthError.unknown)
                }
            }
        }
    }

    /* Erros and Mapping */
    
    enum AuthError: LocalizedError {
        case mismatchPasswords
        case profileMissing
        case unknown
        var errorDescription: String? {
            switch self {
            case .mismatchPasswords: return "Passwords do not match."
            case .profileMissing:    return "User profile not found."
            case .unknown:           return "An unknown error occurred."
            }
        }
    }
    
    private func convertAchFirestoreToUser(data: [String: Any]) -> [Achievement] {
        let arr = data["achievements"] as? [[String: Any]] ?? []
        return arr.map {
            Achievement(
                name: $0["name"] as? String ?? "",
                description: $0["description"] as? String ?? "",
                icon: $0["icon"] as? String ?? "star",
                unlocked: $0["unlocked"] as? Bool ?? false
            )
        }
    }
    
    enum UserDataError: LocalizedError {
        case notLoggedIn
        
        var errorDescription: String? {
            switch self {
            case .notLoggedIn:
                return "No user is currently logged in."
            }
        }
    }
    
    struct ToastMessage {
        let message: String
        let isPositive: Bool
        
        init(_ message: String, isPositive: Bool = true) {
            self.message = message
            self.isPositive = isPositive
        }
    }
    
    func showToast(_ message: String, isPositive: Bool = true) {
        currentToast = ToastMessage(message, isPositive: isPositive)
        
        // Auto-dismiss after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.currentToast = nil
        }
    }
}
