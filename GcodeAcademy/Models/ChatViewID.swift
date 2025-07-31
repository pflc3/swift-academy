import Foundation

/*
 * Identifies elements in the chat ScrollView for scrolling and selection.
 *
 * This enum allows us to use a consistent type for both message IDs and
 * the loading indicator, resolving type mismatches in ScrollViewReader.
 */
enum ChatViewID: Hashable {
    // identifies a chat message using its UUID
    case message(UUID)
    // Identifies the typing/loading indicator
    case loading
}
