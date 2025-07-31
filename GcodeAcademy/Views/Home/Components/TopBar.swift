//
//  TopBar.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//

import SwiftUI

/// A customizable top bar for section headers
struct TopBar: View {
    var color: Color = Color.backgroundApp    // Use theme color (default fallback)
    var title: String
    var fontName: String = "CherryBombOne-Regular"
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .ignoresSafeArea(edges: .top)
                .frame(height: 60)
            
            HStack {
                Text(title)
                    .font(.custom(fontName, size: 28))
                    .foregroundStyle(.white)
                    .padding(.leading, 16)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TopBar(
        color: .backgroundApp,
        title: "Sunny Start",
        fontName: "CherryBombOne-Regular"
    )
}

