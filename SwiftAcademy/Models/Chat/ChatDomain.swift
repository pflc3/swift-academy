import Foundation

enum ChatRole { case user, assistant }

struct ChatTurn {
    let role: ChatRole
    let content: String
}
