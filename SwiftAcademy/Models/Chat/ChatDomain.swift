// Chat domain types.
// Defines simple in-memory chat domain types used by the chat UI and view model.
// Keeps transient chat turn representation separate from persisted DTOs.

import Foundation

enum ChatRole { case user, assistant }

struct ChatTurn {
    let role: ChatRole
    let content: String
}
