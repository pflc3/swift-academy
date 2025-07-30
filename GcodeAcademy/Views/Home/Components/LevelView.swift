//
//  LevelView.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//
import SwiftUI
import Foundation


// If ItemsToDo, ItemsToDoQuiz, TopBar, etc.


struct LevelView: View {
    @State var sheetOpen = false
    var level:Level
    var body: some View {
        Button{
            sheetOpen.toggle()
        }label:{
            LevelViewIcon(level: level)
        }.sheet(isPresented: $sheetOpen){
            print("Open")
        }content:{
            VStack{
                HStack{
                    Spacer()
                    Text(level.title)
                        .foregroundStyle(Color("MainText"))
                        .font(Font.custom("CherryBombOne-Regular", size:28))
                    Spacer()
                    Button{
                        sheetOpen.toggle()
                    }
                    label:{
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                    }
                }
                .padding(.top,20)
                .padding(.horizontal, 20)
                .padding(.bottom,8)
                ScrollView{
                    ForEach(level.activities.keys.sorted(), id: \.self){
                        key in
                        if (key.prefix(5)=="Video") {
                            if (level.activities[key]!["completed"] as! Bool ==  true){
                                ItemsToDo(imageIcon: "play.circle", title: level.activities[key]!["Title"] as! String, completion: "Completed", color: Color("Okay"))
                            }else{
                                ItemsToDo(imageIcon: "play.circle", title: level.activities[key]!["Title"] as! String, completion: "Not Completed", color: Color("Error"))
                            }
                        }else if key.prefix(4) == "Quiz"{
                            if (level.activities[key]!["Accuracy"] as! Int >= 80){
                                ItemsToDoQuiz(imageIcon: "list.clipboard.fill", title: level.activities[key]!["Title"] as! String, completion: level.activities[key]!["Accuracy"] as! Int, color: Color("Okay"))
                            }else if level.activities[key]!["Accuracy"] as! Int >= 50 && (level.activities[key]!["Accuracy"] as! Int) < 80 {
                                ItemsToDoQuiz(imageIcon: "list.clipboard.fill", title: level.activities[key]!["Title"] as! String, completion: level.activities[key]!["Accuracy"] as! Int, color: Color("Start"))
                            }else{
                                ItemsToDoQuiz(imageIcon: "list.clipboard.fill", title: level.activities[key]!["Title"] as! String, completion: level.activities[key]!["Accuracy"] as! Int, color: Color("Error"))
                            }
                        }else{
                            if (level.activities[key]!["completed"] as! Bool ==  true){
                                ItemsToDo(imageIcon: "text.document.fill", title: level.activities[key]!["Title"] as! String, completion: "Completed", color: Color("Okay"))
                            }else{
                                ItemsToDo(imageIcon: "text.document.fill", title: level.activities[key]!["Title"] as! String, completion: "Not Completed", color: Color("Error"))
                            }
                        }
                        
                    }
                }
                Spacer()
                if level.Unlocked{
                    Button("Continue"){
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Others"))
                    .padding(8)
                    .font(Font.custom("Chicle-Regular", size: 25))
                }else{
                    Button("Take Evaluation Quiz"){
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Error"))
                    .padding(8)
                    .font(Font.custom("Chicle-Regular", size: 25))
                }
            }
            .presentationDetents([.fraction(0.4)])
            .presentationCornerRadius(25)
            
        }
        
    }
}
let level1 = SunnyStartLevels[0]

#Preview {
    LevelView(level: level1)
}

