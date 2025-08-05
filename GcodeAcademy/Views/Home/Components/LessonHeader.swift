//
//  LessonHeader.swift
//  GcodeAcademy
//
//  Created by Joshua Fineboy-Mark on 8/5/25.
//

import SwiftUI
let lessons = [
    MockData.binaryCommunicationLesson,
    MockData.swiftDataTypesLesson
]
struct LessonHeader: View {
    var user:User
    var Lessons: [Lesson]
    var body: some View {
        VStack(spacing: 0) {
            // Simple welcome section (not a full header since we have one in ContentView)
            VStack(alignment: .leading, spacing: 8) {
                
                // Simple progress indicator
                HStack {
                    Text("\(user.lessonsCompleted)/\(Lessons.count) lessons completed")
                        .font(.bodyMedium)
                        .foregroundColor(.textSecondaryApp)
                    
                    Spacer()
                    
                    Text("\((user.lessonsCompleted/Lessons.count)*100)%")
                        .font(.bodyMedium.bold())
                        .foregroundColor(.primaryApp)
                }
                
                // Progress bar
                ProgressView(value: Float(user.lessonsCompleted/Lessons.count))
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
            LearningPathView(lessons: Lessons)
                .padding(.top, 75)
        }
    }
}

#Preview {
    LessonHeader(user: MockData.currentUser, Lessons: lessons)
}
