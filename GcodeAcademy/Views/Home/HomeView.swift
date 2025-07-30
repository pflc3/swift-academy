//
//  ContentView.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//
import SwiftUI
import Foundation


struct HomeView: View {
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    Background(length: SunnyStartLevels.count, images: Modernimages).ignoresSafeArea()
                    RenderLevels()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            VStack {
                TopBar(Colortheme: Color("MainText"), title: "Learning Path", font: "CherryBombOne-Regular")
                Spacer()
            }
        }.background(Color.white)
            .statusBarHidden(true)
    }
}

#Preview {
    HomeView()
}

struct RenderLevels: View {
    var body: some View {
        VStack{
            ForEach(0..<SunnyStartLevels.count, id:\.self){
                level in
                if (level%2 == 0){
                    ZStack {
                        if (level != (SunnyStartLevels.count-1)){
                            if SunnyStartLevels[level+1].Unlocked{
                                if level != 0{
                                    Rectangle()
                                        .fill(.others.gradient)
                                        .frame(width: 3, height:195)
                                        .offset(x:-1, y:15)
                                        .rotationEffect(Angle(degrees: 40))
                                }else{
                                    Rectangle()
                                        .fill(.others.gradient)
                                        .frame(width: 3, height:180)
                                        .offset(x:30, y:30)
                                        .rotationEffect(Angle(degrees: 45))
                                }
                            }else{
                                if level != 0{
                                    Rectangle()
                                        .fill(.black.gradient)
                                        .frame(width: 3, height:195)
                                        .offset(x:-1, y:15)
                                        .rotationEffect(Angle(degrees: 40))
                                }else{
                                    Rectangle()
                                        .fill(.black.gradient)
                                        .frame(width: 3, height:180)
                                        .offset(x:30, y:30)
                                        .rotationEffect(Angle(degrees: 40))
                                }
                            }
                        }
                        if level != 0{
                            LevelView(level: SunnyStartLevels[level])
                                .offset(x:70,y:-90)
                        }else{
                            LevelView(level: SunnyStartLevels[level])
                                .offset(x:70,y:0)
                        }
                    }
                }else{
                    ZStack {
                        if (level != (SunnyStartLevels.count-1)){
                            if SunnyStartLevels[level+1].Unlocked{
                                Rectangle()
                                    .fill(.others.gradient)
                                    .frame(width: 3, height:195)
                                    .offset(x:1, y:15)
                                    .rotationEffect(Angle(degrees: -40))
                            }else{
                                Rectangle()
                                    .fill(.black.gradient)
                                    .frame(width: 3, height:195)
                                    .offset(x:1, y:15)
                                    .rotationEffect(Angle(degrees: -40))
                            }
                        }
                        LevelView(level: SunnyStartLevels[level])
                            .offset(x:-70,y:-90)
                    }
                }
            }
        }
    }
}
