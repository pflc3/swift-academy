//
//  LessonView.swift
//  GcodeAcademy
//
//  Created by Joshua Fineboy-Mark on 7/31/25.
//


import SwiftUI

/// A card that displays the lesson preview and shows detailed content in a sheet
struct LessonView: View {
    @State private var sheetOpen = false
    let lesson: Lesson

    var body: some View {
        Button {
            if lesson.isUnlocked {
                sheetOpen.toggle()
            }
        } label: {
            LessonViewIcon(lesson: lesson)
                .opacity(1)
                .overlay(
                    Group {
                        if !lesson.isUnlocked {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 30, height: 30)
                                )
                                .offset(x: 35, y: -35)
                        }
                    }
                )
        }
        .disabled(!lesson.isUnlocked)
        .sheet(isPresented: $sheetOpen) {
            LessonDetailSheet(lesson: lesson, sheetOpen: $sheetOpen)
        }
    }
}
#Preview {
    LessonView(lesson: Lessons[1])
}
