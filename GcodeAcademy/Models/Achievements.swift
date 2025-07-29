//
//  Achievements.swift
//  GcodeAcademy
//
//  Created by Emmanuel L on 7/29/25.
//

import Foundation

struct Achievement: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var icon: String
    var unlocked: Bool = false
}
