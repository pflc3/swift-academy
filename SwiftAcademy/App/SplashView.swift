// SplashView.
// Minimal launch screen placeholder shown during app startup and previews.
// Provides a background-aligned view for initial app presentation.

import SwiftUI

/// Minimal launch placeholder used during app boot and for SwiftUI previews.
/// Keeps the initial UX visually neutral while the session bootstraps.
struct SplashView: View {
    var body: some View {
        // Full-screen background aligns with system appearance.
        Color(.systemBackground).ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
