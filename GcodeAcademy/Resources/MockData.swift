//
//  MockData.swift
//  GcodeAcademy
//
//  Created by Estuardo Lopez Letona on 7/28/25.
//

import Foundation

struct MockData {
    // Sample lessons
    static let lessons: [Lesson] = [
        Lesson(title: "Introduction to Swift", description: "Learn the basics of Swift"),
        Lesson(title: "Variables and Constants", description: "Understanding data storage")
    ]
    
    // Sample user
    static let currentUser = User(name: "Gcode Student")
}
