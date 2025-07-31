//
//  LessonViewIcon.swift
//  GcodeAcademy
//
//  Created by Joshua Fineboy-Mark on 7/31/25.
//


import SwiftUI

/// Compact icon for a single lesson
struct LessonViewIcon: View {
    var lesson: Lesson

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: lesson.isUnlocked ? "book.fill" : "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .foregroundColor(lesson.isUnlocked ? .accentApp : .black)

            Text(lesson.title)
                .font(.caption)
                .foregroundColor(lesson.isUnlocked ? .black : .white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .padding(15)
        .frame(width: 110, height: 110)
        .background(lesson.isUnlocked ? Color.bg : Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .dividerApp.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    LessonViewIcon(lesson: Lessons[0])
}
