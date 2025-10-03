// ToastCenter.
// Lightweight notification center for short, user-facing toast messages shown in the UI.
// Handles auto-hide behavior and exposes the current toast as a published property.

import Foundation

@MainActor
final class ToastCenter: ObservableObject {
    struct ToastMessage: Equatable {
        let message: String
        let isPositive: Bool
    }

    @Published var current: ToastMessage?

    func show(_ message: String, positive: Bool = true, autoHide: Bool = true) {
        current = ToastMessage(message: message, isPositive: positive)
        if autoHide {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in self?.current = nil }
        }
    }
}
