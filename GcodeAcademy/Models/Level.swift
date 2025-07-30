//
//  Level.swift
//  GCode Academy
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//
//  Represents a learning level, including title, category, progress,
//  and a list of activities like videos, quizzes, and articles.

import Foundation

struct Level: Identifiable {
    var id = UUID()
    var category: String
    var title: String
    var Unlocked: Bool
    var PercentCompleted: Double
    var activities: [String: [String: Any]]
}
