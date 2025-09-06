import SwiftUI

struct LessonVideoSection: View {
    let videoID: String
    @Binding var isVideoWatched: Bool

        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                // Section title
                Text("Video")
                    .font(.titleMedium)
                    .foregroundColor(.textPrimaryApp)
                
                // Embedded video player
                YouTubePlayer(videoID: videoID)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .cornerRadius(12)
                
                // "Mark as watched" checkbox
                Button(action: { isVideoWatched.toggle() }) {
                    HStack {
                        Image(systemName: isVideoWatched ? "checkmark.square.fill" : "square")
                            .foregroundColor(isVideoWatched ? .accentApp : .textSecondaryApp)
                        
                        Text("Mark video as watched")
                            .font(.bodyMedium)
                            .foregroundColor(.textPrimaryApp)
                    }
                    .padding(.vertical, 8)
                }
                .buttonStyle(.plain)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.cardBackgroundApp)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
        }
    }


#Preview {
    LessonVideoSection(
        videoID: "zDNaUi2cjv4",
        isVideoWatched: .constant(false)
    )
    .padding()
}

