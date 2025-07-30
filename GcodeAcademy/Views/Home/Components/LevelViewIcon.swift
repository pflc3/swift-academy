//
//  LevelViewIcon.swift
//  GCode Academy
//
//  Returns an icon representing a level's category and status.
//

import SwiftUI

struct LevelViewIcon: View {
    var level: Level
    
    var body: some View {
        let iconImage: String
        switch level.category {
        case "Ethics": iconImage = "Ethics"
        case "Code": iconImage = "Code"
        default: iconImage = "Business"
        }
        
        let background: Color
        if level.Unlocked {
            background = level.PercentCompleted == 100 ? .okay : .start
        } else {
            background = .nonAccess
        }
        
        return Image(iconImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70)
            .padding(20)
            .background(background.gradient)
            .clipShape(.circle)
    }
}

