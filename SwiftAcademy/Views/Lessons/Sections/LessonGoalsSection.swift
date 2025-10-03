// SwiftAcademy Views - LessonGoalsSection.
// Displays learning goals with checkboxes and exposes a binding to the parent view model.
// Toggling goals updates the set of completed goal IDs used to calculate progress.
import SwiftUI

struct LessonGoalsSection: View {
    let goals: [Lesson.LessonGoal]          // List of all lesson goals
    @Binding var completedGoals: Set<UUID> // Set of completed goal IDs (bound to parent)

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Section header
            Text("Goals")
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)

            // List of goals with checkboxes
            VStack(alignment: .leading, spacing: 8) {
                ForEach(goals) { goal in
                    Button(
                        action: { toggleGoal(goal.id) },
                        label: {
                            HStack(alignment: .top) {
                                Image(systemName: completedGoals.contains(goal.id)
                                      ? "checkmark.square.fill" : "square")
                                    .foregroundColor(
                                        completedGoals.contains(goal.id) ? .accentApp : .textSecondaryApp
                                    )
                                    .padding(.top, 2)

                                Text(goal.description)
                                    .font(.bodyMedium)
                                    .foregroundColor(.textPrimaryApp)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    )
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }

    // Toggle goal between completed and not
    private func toggleGoal(_ id: UUID) {
        if completedGoals.contains(id) {
            completedGoals.remove(id)
        } else {
            completedGoals.insert(id)
        }
    }

}

#Preview {
    LessonGoalsSection(
        goals: LessonData.binaryLesson.goals,
        completedGoals: .constant([])
    )
    .padding()
}
