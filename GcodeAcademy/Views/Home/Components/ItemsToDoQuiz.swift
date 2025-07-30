//
//  ItemsToDoQuiz.swift
//  GCode Academy
//
//  Displays quiz completion status and accuracy.
//

import SwiftUI

struct ItemsToDoQuiz: View {
    var imageIcon: String
    var title: String
    var completion: Int
    var color: Color
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: imageIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color("Others"))
                    .frame(width: 25)
                Text(title)
                    .font(Font.custom("PatrickHand-Regular", size: 20))
            }
            Spacer()
            Text("\(completion)%")
                .font(Font.custom("PatrickHand-Regular", size: 20))
                .foregroundStyle(color)
        }
        .padding(.horizontal, 15)
    }
}
