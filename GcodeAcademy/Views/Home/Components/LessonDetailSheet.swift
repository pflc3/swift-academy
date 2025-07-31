//
//  LessonDetailSheet.swift
//  GcodeAcademy
//
//  Created by Joshua Fineboy-Mark on 7/31/25.
//
import SwiftUI

struct LessonDetailSheet: View {
    let lesson: Lesson
    @Binding var sheetOpen: Bool

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Spacer()
                Text(lesson.title)
                    .font(.titleLarge)
                    .foregroundColor(.textPrimaryApp)
                Spacer()
                Button {
                    sheetOpen.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.textPrimaryApp)
                        .padding(6)
                        .background(Color.surfaceApp)
                        .clipShape(Circle())
                }
            }
            .padding(.top, 24)
            .padding(.horizontal, 20)
            .padding(.bottom, 8)

            // Description
            Text(lesson.description)
                .font(.bodyMedium)
                .foregroundColor(.textSecondaryApp)
                .padding(.horizontal, 20)
                .padding(.bottom, 12)

            Divider().background(Color.dividerApp)

            // Scrollable content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if !lesson.goals.isEmpty {
                        Text("What You'll Learn")
                            .font(.titleSmall)
                            .foregroundColor(.textPrimaryApp)

                        ForEach(lesson.goals) { goal in
                            Label(goal.description, systemImage: "checkmark.circle.fill")
                                .font(.bodySmall)
                                .foregroundColor(.textSecondaryApp)
                        }
                    }

                    if !lesson.contentSections.isEmpty {
                        Text("Sections")
                            .font(.titleSmall)
                            .foregroundColor(.textPrimaryApp)
                            .padding(.top)

                        ForEach(lesson.contentSections) { section in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(section.title)
                                    .font(.bodyLarge)
                                    .foregroundColor(.accentApp)

                                Text(section.content)
                                    .font(.bodySmall)
                                    .foregroundColor(.textSecondaryApp)

                                if let code = section.codeExample {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        Text(code)
                                            .font(.system(.body, design: .monospaced))
                                            .foregroundColor(.textTertiaryApp)
                                            .padding()
                                            .background(Color.surfaceApp)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                            .padding(.vertical, 6)
                        }
                    }

                    if !lesson.resources.isEmpty {
                        Text("Additional Resources")
                            .font(.titleSmall)
                            .foregroundColor(.textPrimaryApp)
                            .padding(.top)

                        ForEach(lesson.resources) { resource in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(resource.title)
                                    .font(.bodyLarge)
                                    .foregroundColor(.accentApp)

                                Text(resource.description)
                                    .font(.caption)
                                    .foregroundColor(.textSecondaryApp)

                                Link("Visit", destination: URL(string: resource.url)!)
                                    .font(.caption)
                                    .foregroundColor(.buttonHoverApp)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }

            // Bottom Action
            Button("Start Lesson") {
                // Start logic
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentApp)
            .padding()
            .font(.titleMedium)
        }
        .background(Color.backgroundApp)
        .presentationDetents([.fraction(0.9)])
        .presentationCornerRadius(25)
    }
}
