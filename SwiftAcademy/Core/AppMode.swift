// AppMode.
// Identifies runtime mode used across the app (preview, test, production).
// Used to switch mocks and test behavior consistently across modules.

import Foundation

/// Runtime mode used to toggle preview/test behaviors and mock usage.
/// Read-only convenience used across the app to select mock vs. production paths.
enum AppMode {
    case preview, test, prod

    static var current: AppMode {
        // Xcode previews and XCTest detection are environment driven.
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" { return .preview }
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil { return .test }
        return .prod
    }

    static var useMocks: Bool {
        switch current {
        case .preview, .test: return true
        case .prod: return false
        }
    }
}
