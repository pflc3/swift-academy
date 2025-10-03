// UserService.
// Handles user authentication, registration, profile loading, and writes to Firestore.
// Translates Firestore documents into `UserProfile` and updates user fields safely.

import FirebaseAuth
import FirebaseFirestore
import Foundation

@MainActor
final class UserService: ObservableObject {
    private var firestore: Firestore { Firestore.firestore() }

    func signup(name: String, email: String, password: String) async throws -> UserProfile {
        let result: AuthDataResult = try await withCheckedThrowingContinuation { continuation in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = result {
                    continuation.resume(returning: result)
                }
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
        let result: AuthDataResult = try await withCheckedThrowingContinuation { continuation in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = result {
                    continuation.resume(returning: result)
                }
            }
        }
        return try await loadProfile(uid: result.user.uid)
    }

    func logout() throws {
        try Auth.auth().signOut()
    }

    func loadProfile(uid: String) async throws -> UserProfile {
        let snapshot: DocumentSnapshot = try await withCheckedThrowingContinuation { continuation in
            firestore.collection("users").document(uid).getDocument { snapshot, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let snapshot = snapshot {
                    continuation.resume(returning: snapshot)
                }
            }
        }
        guard let documentData = snapshot.data() else {
            throw NSError(domain: "UserService", code: 404)
        }
        return mapUser(uid: uid, data: documentData)
    }

    func updateProfile(uid: String, name: String, bio: String) async throws {
        try await writeUser(uid: uid, data: ["name": name, "bio": bio], merge: true)
    }

    func markLessonCompletedIfNeeded(for lesson: Lesson, user: inout UserProfile) async throws {
        guard let lessonIndex = LessonData.allLessons.firstIndex(of: lesson) else { return }
        guard lessonIndex == user.lessonsCompleted else { return }
        let newCount = user.lessonsCompleted + 1
        try await writeUser(uid: user.uid, data: ["lessonsCompleted": newCount], merge: true)
        user.lessonsCompleted = newCount
    }

    private func writeUser(uid: String, data: [String: Any], merge: Bool) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            firestore.collection("users").document(uid).setData(data, merge: merge) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }

    private func mapUser(uid: String, data: [String: Any]) -> UserProfile {
        let achievementsArray = (data["achievements"] as? [[String: Any]] ?? []).map {
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
            achievements: achievementsArray
        )
    }
}
