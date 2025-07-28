//
//  User.swift
//  GcodeAcademy
//
//  Created by Estuardo Lopez Letona on 7/28/25.
//
import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var lessonsCompleted: Int = 0
}
