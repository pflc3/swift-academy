//
//  TopBar.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//

import SwiftUI

struct TopBar: View {
    var Colortheme:Color
    var title:String
    var font:String
    var body: some View {
            ZStack {
                Rectangle()
                    .fill(Colortheme)
                    .ignoresSafeArea()
                    .frame(height:60)
                HStack {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(Font.custom(font, size: 30))
                }.padding(.horizontal,20)
            }
    }
}

#Preview {
    TopBar(Colortheme: Color("SunnyHeader"), title: "Sunny Start", font: "CherryBombOne-Regular")
}
