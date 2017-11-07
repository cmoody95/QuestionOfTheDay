//
//  Opinion.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/5/17.
//

import Foundation
@objcMembers
class Opinion{
    var objectID: String?
    var question:QuestionOfTheDay
    var answer:Int
    
    init(question:QuestionOfTheDay, answer:Int){
        self.objectID = ""
        
        self.question = question
        self.answer = answer
    }
    convenience init(){
        self.init(question: QuestionOfTheDay(question: "", answer0: "", answer1: "", answer2: ""), answer: 0)
    }
}
