// SwiftAcademy Models - Chat view identifiers.
// Lightweight enum used to identify chat list rows and special states for UI lists.
import Foundation

enum ChatViewID: Hashable {
    case message(UUID)
    case loading
}
