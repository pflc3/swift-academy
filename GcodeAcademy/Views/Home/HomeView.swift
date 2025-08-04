import SwiftUI

struct HomeView: View {
    // Sample lessons (in a real app, this would come from a data model)
    let lessons = [
        MockData.binaryCommunicationLesson,
        MockData.binaryCommunicationLesson
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    
                    // Diagonal learning path
                    // We'll repeat our two lessons multiple times to simulate content
                    ForEach(0..<8) { index in
                        // Alternate between left and right
                        let isRightSide = index % 2 == 1
                        let currentLesson = lessons[index % 2]
                        
                        // Diagonal path element with lesson
                        HStack {
                            // Spacer on the right side pushes content left
                            if isRightSide {
                                Spacer()
                            }
                            
                            // Lesson card
                            simpleLessonCard(
                                lesson: currentLesson,
                                index: index + 1,
                                isCompleted: index < 2
                            )
                            .frame(width: 250)
                            
                            // Spacer on the left side pushes content right
                            if !isRightSide {
                                Spacer()
                            }
                        }
                        .padding(.bottom, 10)
                        
                        // Diagonal connector line (except for last item)
                        if index < 7 {
                            ZStack {
                                // Diagonal line - direction depends on current position
                                if isRightSide {
                                    // Right to left diagonal
                                    DiagonalLine(fromRight: true)
                                        .stroke(Color.primaryApp, lineWidth: 3)
                                        .frame(height: 60)
                                } else {
                                    // Left to right diagonal
                                    DiagonalLine(fromRight: false)
                                        .stroke(Color.primaryApp, lineWidth: 3)
                                        .frame(height: 60)
                                }
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    
                    // Bottom padding
                    Spacer(minLength: 40)
                }
                .padding(.horizontal)
            }
        }
    }
    
    // Simplified lesson card component
    @ViewBuilder
    func simpleLessonCard(lesson: Lesson, index: Int, isCompleted: Bool) -> some View {
        NavigationLink(destination: LessonDetailView()) {
            VStack(alignment: .leading, spacing: 10) {
                // Lesson number and completion status
                HStack {
                    // Circle with number
                    ZStack {
                        Circle()
                            .fill(isCompleted ? Color.primaryApp : Color.surfaceApp)
                            .frame(width: 36, height: 36)
                        
                        Text("\(index)")
                            .font(.bodyMedium.bold())
                            .foregroundColor(isCompleted ? .white : .textSecondaryApp)
                    }
                    
                    Spacer()
                    
                    // Difficulty indicator
                    Text(lesson.difficulty)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.surfaceApp)
                        )
                        .foregroundColor(.textSecondaryApp)
                }
                
                // Lesson title
                Text(lesson.title)
                    .font(.bodyLarge.bold())
                    .foregroundColor(.textPrimaryApp)
                    .lineLimit(2)
                
                // Duration
                Label(lesson.duration, systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.textTertiaryApp)
            }
            .padding()
            .background(Color.cardBackgroundApp)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Custom shape for diagonal lines
struct DiagonalLine: Shape {
    let fromRight: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if fromRight {
            path.move(to: CGPoint(x: rect.maxX, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        } else {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        
        return path
    }
}

#Preview {
    HomeView()
}
