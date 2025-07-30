import SwiftUI

struct YouTubePlayer: View {
    let videoID: String
    
    var body: some View {
        Text("YouTube Player Component")
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    YouTubePlayer(videoID: "example")
}
