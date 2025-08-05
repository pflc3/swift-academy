import SwiftUI

struct HomeView: View {
    // Using your project's lesson data
    let lessons = [
        MockData.binaryCommunicationLesson,
        MockData.swiftDataTypesLesson
    ]
    
    // For demo purposes, repeat lessons to show more in the path
    var allLessons: [Lesson] {
        var result: [Lesson] = []
        // Repeat lessons to have 8 total for demonstration
        for i in 0..<4 {
            result.append(lessons[i % 2])
        }
        return result
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                // Keep student's background with floating icons
                BackgroundView(length: backgroundLength(for: allLessons.count))
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Simple welcome section (not a full header since we have one in ContentView)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your Learning Path")
                            .font(.titleMedium)
                            .foregroundColor(.textPrimaryApp)
                        
                        // Simple progress indicator
                        HStack {
                            Text("2/\(allLessons.count) lessons completed")
                                .font(.bodyMedium)
                                .foregroundColor(.textSecondaryApp)
                            
                            Spacer()
                            
                            Text("25%")
                                .font(.bodyMedium.bold())
                                .foregroundColor(.primaryApp)
                        }
                        
                        // Progress bar
                        ProgressView(value: 0.25)
                            .tint(Color.primaryApp)
                            .padding(.bottom, 8)
                    }
                    .padding()
                    .background(Color.cardBackgroundApp)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Learning path view - keep the zigzag pattern
                    LearningPathView(lessons: allLessons)
                        .padding(.top, 20)
                }
            }
        }
        .background(Color.backgroundApp)
    }
    
    // Keep student's background length calculation
    private func backgroundLength(for lessonCount: Int) -> Int {
        let estimatedFill = Int(UIScreen.main.bounds.height / 180) + 2
        return max(lessonCount, estimatedFill)
    }
}

#Preview {
    HomeView()
}
