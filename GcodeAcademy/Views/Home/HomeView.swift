//
//  ContentView.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//
import SwiftUI
import Foundation

/// The main home screen displaying the user's learning path
import SwiftUI

struct HomeView: View {
    var lessons = Lessons

    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    // Dynamically calculate background length
                    Background(length: backgroundLength(for: lessons.count), images: Modernimages)
                        .ignoresSafeArea()

                    RenderLevels(lessons: Lessons)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.padding(.top,20)

            VStack {
                TopBar(
                    color: .blue,
                    title: "Learning Path",
                    fontName: "CherryBombOne-Regular"
                )
                Spacer()
            }
        }
        .background(Color.white)
        .statusBarHidden(true)
    }

    /// Calculates background repetition length based on number of lessons
    private func backgroundLength(for lessonCount: Int) -> Int {
        let estimatedFill = Int(UIScreen.main.bounds.height / 180) + 2 // fallback to fill screen
        return max(lessonCount, estimatedFill)
    }
}


#Preview {
    HomeView()
}


import SwiftUI

/// View responsible for rendering the vertical zig-zag level/lesson path
struct RenderLevels: View {
    let lessons: [Lesson]

    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            ForEach(lessons.indices, id: \.self) { index in
                let lesson = lessons[index]
                let isEven = index % 2 == 0
                let isLast = index == lessons.count - 1
                
                ZStack {
                    // Draw the connecting path line unless it's the last lesson
                    if !isLast {
                        let nextLessonUnlocked = false // Replace with actual unlock logic if needed
                        
                        LessonConnectorLine(
                            isEven: isEven,
                            unlocked: nextLessonUnlocked,
                            isFirst: index == 0
                        )
                    }
                    
                    // Display lesson view offset based on position
                    LessonView(lesson: lesson)
                        .offset(
                            x: isEven ? 70 : -70,
                            y: index == 0 ? 0 : -90
                        )
                }
            }
          Spacer()
        }
    }
}

import SwiftUI

/// Reusable vertical connector line between lessons
struct LessonConnectorLine: View {
    var isEven: Bool
    var unlocked: Bool
    var isFirst: Bool

    var body: some View {
        Rectangle()
            .fill(unlocked ? .green : .black )
            .frame(width: 3, height: isFirst ? 180 : 195)
            .offset(
                x: isEven ? (isFirst ? 30 : -1) : 1,
                y: isFirst ? 30 : 15
            )
            .rotationEffect(Angle(degrees: isEven ? (isFirst ? 45 : 40) : -40))
    }
}
