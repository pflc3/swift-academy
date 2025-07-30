//
//  DummyData.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/28/25.
//let level1 = Level(category: "Code", title: "Data Types In Swift", Unlocked: true, PercentCompleted: 100,
//activities: [
//"Video":[
//"URL":"www.youtube.com", - Videos require URL
//"Title":"Full Lesson Video", - Every Entry Must Have Title
//"completed":true - Video require completed
//],
//"Quiz1":[
//"Accuracy":90, - All quizzes require Accuracy
//"URL":"www.youtube.com",
//"Title":"Quiz 1",
//],
//])
struct QuizType:Identifiable{
    public var id = UUID()
    var Question: [String:[String:Bool]]
}
enum types{
    case article
    case slides
    case externalArticle
}
import Foundation

var SunnyStartLevels:[Level] = [
    Level(category: "Ethics", title: "Emotions Of Learning", Unlocked: true, PercentCompleted: 100,
          activities: [
            "Video0":[
                "URL":"https://www.youtube.com/watch?v=ozsgl_sLnHQ",
                "Title":"The Emotions Of Learning",
                "completed":true
            ],
            "Video1": [
                "URL":"https://www.youtube.com/watch?v=hUdB232fIXM",
                "Title":"The 5 Stages Of Learning To Code",
                "completed":true,
            ],
            "Video2":[
                "URL":"https://www.youtube.com/watch?v=SCsQHe-NpaM",
                "Title":"The Curve Of Forgetting",
                "completed":true
            ]
          ]),
    Level(category: "Ethics", title: "The History Of Computing", Unlocked: false, PercentCompleted: 0,
          activities: [
            "Video0":[
                "URL":"https://www.youtube.com/watch?v=-M6lANfzFsM",
                "Title":"The History Of Computing",
                "completed":false
            ],
            "Quiz0":[
                "Title":"The History Of Computers Quiz",
                "Accuracy":0,
                "Quiz": QuizType(
                    Question:[
                        "According to the video, what was one of the first machines used for counting and calculating?":
                            ["Calculator":false,
                             "Abacus":true,
                             "Sticks & Rocks":false,
                             "Fingers":false],
                        "Who created the first mechanical adding machine?":
                            [
                                "Alexander Graham Bell":false,
                                "Charles Babbage":false,
                                "Isaac Newton":false,
                                "Blaise Pascal":true
                            ],
                        "What was the name of said mechanical adding machine?":
                            [
                                "Pascaline":true,
                                "ENIAC":false,
                                "Apple 1":false,
                                "Abacus":false
                            ]
                    ])
            ],
            "Article":[
                "Type": types.article,
                "Title": "The History Of Computers",
                "Body": "This is the history of computers overtime. Starting for 3000BC...",
                "completed":false
            ]
          ])
]
