import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
final class UserService: ObservableObject {
    private var db: Firestore { Firestore.firestore() }
    
    func signup(name: String, email: String, password: String) async throws -> UserProfile {
        let result = try await withCheckedThrowingContinuation { (c: CheckedContinuation<AuthDataResult, Error>) in
            Auth.auth().createUser(withEmail: email, password: password) { r, e in
                if let e = e { c.resume(throwing: e) }
                else if let r = r { c.resume(returning: r) }
            }
        }
        let uid = result.user.uid
        let profile: [String: Any] = [
            "name": name,
            "email": email,
            "bio": "Swift Academy Student",
            "lessonsCompleted": 0,
            "achievements": MockData.defaultAchievementsFirestoreLocked()
        ]
        try await writeUser(uid: uid, data: profile, merge: false)
        return try await loadProfile(uid: uid)
    }
    
    func login(email: String, password: String) async throws -> UserProfile {
        let result = try await withCheckedThrowingContinuation { (c: CheckedContinuation<AuthDataResult, Error>) in
            Auth.auth().signIn(withEmail: email, password: password) { r, e in
                if let e = e { c.resume(throwing: e) }
                else if let r = r { c.resume(returning: r) }
            }
        }
        return try await loadProfile(uid: result.user.uid)
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    func loadProfile(uid: String) async throws -> UserProfile {
        let snap = try await withCheckedThrowingContinuation { (c: CheckedContinuation<DocumentSnapshot, Error>) in
            db.collection("users").document(uid).getDocument { s, e in
                if let e = e { c.resume(throwing: e) }
                else if let s = s { c.resume(returning: s) }
            }
        }
        guard let data = snap.data() else { throw NSError(domain: "UserService", code: 404) }
        return mapUser(uid: uid, data: data)
    }
    
    func updateProfile(uid: String, name: String, bio: String) async throws {
        try await writeUser(uid: uid, data: ["name": name, "bio": bio], merge: true)
    }
    
    func markLessonCompletedIfNeeded(for lesson: Lesson, user: inout UserProfile) async throws {
        guard let idx = LessonData.allLessons.firstIndex(of: lesson) else { return }
        guard idx == user.lessonsCompleted else { return }
        let newCount = user.lessonsCompleted + 1
        try await writeUser(uid: user.uid, data: ["lessonsCompleted": newCount], merge: true)
        user.lessonsCompleted = newCount
    }

    private func writeUser(uid: String, data: [String: Any], merge: Bool) async throws {
        try await withCheckedThrowingContinuation { (c: CheckedContinuation<Void, Error>) in
            db.collection("users").document(uid).setData(data, merge: merge) { e in
                if let e = e { c.resume(throwing: e) } else { c.resume(returning: ()) }
            }
        }
    }
    
    private func mapUser(uid: String, data: [String: Any]) -> UserProfile {
        let achArr = (data["achievements"] as? [[String: Any]] ?? []).map {
            Achievement(
                id: UUID(),
                name: $0["name"] as? String ?? "",
                description: $0["description"] as? String ?? "",
                icon: $0["icon"] as? String ?? "star",
                unlocked: $0["unlocked"] as? Bool ?? false
            )
        }
        return UserProfile(
            uid: uid,
            email: data["email"] as? String ?? "",
            name: data["name"] as? String ?? "Student",
            bio: data["bio"] as? String ?? "",
            lessonsCompleted: data["lessonsCompleted"] as? Int ?? 0,
            achievements: achArr
        )
    }
}
