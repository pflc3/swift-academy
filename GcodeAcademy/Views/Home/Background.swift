//
//  Background.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//

import SwiftUI

public var Summerimages:[String] = ["summer-beach", "sun", "surfing"]
public var Modernimages:[String] = ["ai","app-store","apple","swift","binary-coding","github"]

struct Background: View {
    var length:Int
    var images: [String]
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                ForEach(Range(0...length), id:\.self){
                    i in
                    if (i%2==0){
                        BgImage(image: images[Int.random(in: 0...(images.count)-1)], offsetRange: 128)
                    }else{
                        BgImage(image: images[Int.random(in: 0...(images.count)-1)], offsetRange: -120)
                    }
                }
                Spacer()
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    }
}

#Preview {
    Background(length: 5, images: Modernimages)
}

struct BgImage: View {
    var image:String
    var size:CGFloat = 160
    var offsetRange:Int
    var body: some View {
        VStack {
            if (image=="sun"||image=="swift"||image=="github"||image=="ai") {
                Image(image)
                    .resizable()
                    .opacity(0.7)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size-40, height:size-40)
                    .padding(10)
                    .offset(x:CGFloat(offsetRange), y:CGFloat(Int.random(in: -5...5)))
            } else if image=="surfing"{
                Image(image)
                    .resizable()
                    .opacity(0.8)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height:size)
                    .padding(10)
                    .offset(x:CGFloat(offsetRange), y:CGFloat(Int.random(in: -5...5)))
            }else{
                Image(image)
                    .resizable()
                    .opacity(0.8)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height:size)
                    .padding(10)
                    .offset(x:CGFloat(offsetRange), y:CGFloat(Int.random(in: -5...5)))

            }
        }
    }
}
