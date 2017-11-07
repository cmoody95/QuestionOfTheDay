//
//  QuestionOfTheDay.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/5/17.
//

import Foundation

class QuestionOfTheDay : NSObject{
    var create:NSDate
    var update:NSDate
    var objectID:String
    
    var question:String?
    var answer0:String?
    var answer1:String?
    var answer2:String?
    
    init(question: String, answer0: String, answer1: String, answer2: String){
        self.question = question
        self.answer0 = answer0
        self.answer1 = answer1
        self.answer2 = answer2
        
        self.create = NSDate()
        self.update = NSDate()
        self.objectID = ""
    }
    override convenience init(){
        self.init(question: "", answer0: "", answer1: "", answer2: "")
    }
}
