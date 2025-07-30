import SwiftUI

// Slide preview card and open button
struct LessonSlidesSection: View {
    @Binding var showingSlides: Bool // Controls sheet/modal visibilty

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Section header
            Text("Presentation Slides")
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)
            
            // Slide thumbnail (just visual placeholders for now)
            HStack(spacing: 10) {
                ForEach(0..<3) { index in
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.surfaceApp)
                        .frame(height:90)
                        .overlay(
                            Text("Slide \(index + 1)")
                                .font(.caption)
                                .foregroundColor(.textTertiaryApp)
                            )
                }
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
        .shadow(color: Color.black.opacity(0.03), radius: 3, x: 0, y: 1)
    }
}

// Full-screen modal slide view (can embed actual presentation in future)
struct LessonSlidesDetailView: View {
    @Binding var showingSlides: Bool
    
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
            
            // Slide content area
            Text("Google Slides Presentation")
                .font(.titleMedium)
                .padding(.bottom, 20)
            
            // Placeholder slide display area
            Color.gray.opacity(0.2)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    VStack {
                        Image(systemName: "doc.text.image")
                            .font(.system(size:60))
                            .foregroundColor(.primaryApp.opacity(0.8))
                        Text("Slides would appear here")
                            .padding(.top, 10)
                    }
                    
                )
        }
    }
}

// Previews
#Preview("SlidesSection") {
    LessonSlidesSection(showingSlides: .constant(false))
        .padding()
}

#Preview("SlidesDetailView"){
    LessonSlidesDetailView(showingSlides: .constant(true))
}











