import SwiftUI

// Displays a checklist of goals for a lesson
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
                    Button(action : {
                        toggleGoal(goal.id) // Toggle goal on top
                    }) {
                        HStack(alignment: .top) {
                            // Show checked or unchecked box
                            Image(systemName: completedGoals.contains(goal.id) ? "checkmark.square.fill" : "square")
                                .foregroundColor(completedGoals.contains(goal.id) ? .accentApp : .textSecondaryApp)
                                .padding(.top, 2)
                            
                            // Show goal description
                            Text(goal.description)
                                .font(.bodyMedium)
                                .foregroundColor(.textPrimaryApp)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .buttonStyle(.plain) // Remove default blue button style
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
