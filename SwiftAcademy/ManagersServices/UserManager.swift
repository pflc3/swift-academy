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

    // Firestore handle
    private let db = Firestore.firestore()

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
        try await setUserDoc(uid: uid, data: profile)

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
        let snap = try await getUserDoc(uid: uid)
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

    private func setUserDoc(uid: String, data: [String: Any]) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            db.collection("users").document(uid).setData(data) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }

    private func getUserDoc(uid: String) async throws -> DocumentSnapshot {
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
}
