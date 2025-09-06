import SwiftUI

struct LessonHeaderSection: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var userManager: UserManager

    let lesson: Lesson
    let progressPercentage: Double
    
    private var percent: Int {
        return Int(progressPercentage * 100.0)
    }
    
    private var isCompleted: Bool {
        return percent >= 100
    }
    
    private var lessonIndex: Int? {
        return LessonData.allLessons.firstIndex(of: lesson)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Description
            Text(lesson.description)
                .font(.bodyLarge)
                .foregroundColor(.textSecondaryApp)
                .padding(.top, 4)
            
            // Metadata row with completion status
            HStack(spacing: 16) {
                // Difficulty
                Label {
                    Text(lesson.difficulty.rawValue)
                        .font(.bodySmall)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "chart.bar")
                        .foregroundColor(.primaryApp)
                        .font(.system(size: 19))
                }
                
                // Duration
                Label {
                    Text("\(lesson.duration) minutes")
                        .font(.bodySmall)
                        .foregroundColor(.textSecondaryApp)
                } icon: {
                    Image(systemName: "clock")
                        .foregroundColor(.primaryApp)
                        .font(.system(size: 19))
                }
                
                Spacer()
                
                // Completion status
                HStack(spacing: 6) {
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.accentApp)
                            .font(.system(size: 19))
                        
                        Text("Completed")
                            .font(.bodySmall)
                            .foregroundColor(.accentApp)
                            .onAppear {
                                updateUserProgress()
                            }
                    } else {
                        // Mini progress circle
                        ZStack {
                            Circle()
                                .stroke(Color.dividerApp, lineWidth: 2)
                                .frame(width: 20, height: 20)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(progressPercentage))
                                .stroke(Color.accentApp, lineWidth: 2)
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(-90))
                            
                            Text("\(percent)")
                                .font(.system(size: 10, weight: percent > 0 ? .bold : .regular))
                                .foregroundColor(percent > 0 ? .accentApp : .textSecondaryApp)
                        }
                        
                        Text("Progress")
                            .font(.bodySmall)
                            .foregroundColor(.textSecondaryApp)
                            .padding(.leading, 3)
                    }
                }
            }
        }
        .padding(.bottom, 10)
    }
    
    // Update user progress when a lesson is completed
    private func updateUserProgress() {
        Task {
            await userManager.markLessonCompletedIfNeeded(for: lesson)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        LessonHeaderSection(
            lesson: LessonData.binaryLesson,
            progressPercentage: 0.0
        )
        
        LessonHeaderSection(
            lesson: LessonData.binaryLesson,
            progressPercentage: 0.65
        )
        
        LessonHeaderSection(
            lesson: LessonData.binaryLesson,
            progressPercentage: 1.0
        )
    }
    .padding()
    .background(Color.backgroundApp)
    .environmentObject(MockData.users[0])
    .environmentObject(UserManager())
}
