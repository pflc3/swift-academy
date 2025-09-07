import Foundation

enum AppMode {
    case preview, test, prod

    static var current: AppMode {
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
