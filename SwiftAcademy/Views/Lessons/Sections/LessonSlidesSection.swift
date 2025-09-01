import SwiftUI

// Slide preview card and open button
struct LessonSlidesSection: View {
    @Binding var showingSlides: Bool // Controls sheet/modal visibilty
    var slidesURL: String? // Slides URL from the lesson model
    var slideThumbnails: [String] = [] // Thumbnail image names
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Section header
            Text("Presentation")
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)
            
            // Slide thumbnails
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(slideThumbnails.indices, id: \.self) { index in
                        Image(slideThumbnails[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 90)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.dividerApp, lineWidth: 0.5)
                            )
                    }
                }
                .padding(.vertical, 4)
            }
            
            // Button to open full slide view
            Button(action: {
                showingSlides = true
            }) {
                Text("View All Slides")
                    .font(.bodyMedium)
                    .foregroundColor(.primaryApp)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.primaryApp, lineWidth: 1)
                    )
            }
        }
        .padding(16)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}

// Full-screen modal slide view (can embed actual presentation in future)
struct LessonSlidesDetailView: View {
    @Binding var showingSlides: Bool
    var slidesURL: String? // Slides URL from the lesson model
    
    var body: some View {
        VStack {
            // Top bar with close button
            HStack {
                Spacer()
                Button("Close") {
                    showingSlides = false
                }
                .padding()
            }
            
            // Slides content
            if let urlString = slidesURL, let url = URL(string: urlString) {
                GoogleSlides(embedURL: url)
                    .frame(height: 300)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding()
            } else {
                Text("No slides available for this lesson")
                    .foregroundColor(.textSecondaryApp)
                    .padding()
            }
        }
    }
}

// Previews
#Preview("SlidesSection") {
    LessonSlidesSection(
        showingSlides: .constant(false),
        slidesURL: LessonData.binaryLesson.slidesURL,
        slideThumbnails: LessonData.binaryLesson.slideThumbnails
    )
    .padding()
}

#Preview("SlidesDetailView") {
    LessonSlidesDetailView(
        showingSlides: .constant(true),
        slidesURL: LessonData.binaryLesson.slidesURL
    )
}
