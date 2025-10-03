// LessonResourcesSection.
// Shows external resources for a lesson and toggles visibility for the links list.
// Links open in the system browser via `Link` when available.

import SwiftUI

struct LessonResourcesSection: View {
    let resources: [Lesson.Resource]         // Array of resources from the lesson
    @Binding var showingResourceLinks: Bool  // Tracks if section is expanded

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header with toggle
            Button(
                action: { showingResourceLinks.toggle() },
                label: {
                    HStack {
                        Text("Additional Resources")
                            .font(.titleMedium)
                            .foregroundColor(.textPrimaryApp)

                        Spacer()

                        Image(systemName: showingResourceLinks ? "chevron.up" : "chevron.down")
                            .foregroundColor(.primaryApp)
                    }
                }
            )
            .buttonStyle(.plain)

            // Display links only if expanded
            if showingResourceLinks {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(resources) { resource in
                        // Tapable link to external URL
                        Link(destination: URL(string: resource.url)!) {
                            HStack {
                                Image(systemName: "link")
                                    .foregroundColor(.primaryApp)

                                VStack(alignment: .leading, spacing: 2) {
                                    Text(resource.title)
                                        .font(.bodyMedium)
                                        .foregroundColor(.primaryApp)

                                    Text(resource.description)
                                        .font(.caption)
                                        .foregroundColor(.textSecondaryApp)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 8)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}

// Preview with mock data
#Preview {
    LessonResourcesSection(
        resources: LessonData.binaryLesson.resources,
        showingResourceLinks: .constant(true)
    )
    .padding()
}
