//
//  QuestionOfTheDay.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/5/17.
//

import Foundation
@objcMembers
class QuestionOfTheDay : NSObject{
    var create:NSDate?
    var update:NSDate?
    var objectID:String?
    
    var question:String?
    var answer0:String?
    var answer1:String?
    var answer2:String?
    
    init(question: String, answer0: String, answer1: String, answer2: String){
        self.question = question
        self.answer0 = answer0
        self.answer1 = answer1
        self.answer2 = answer2
        
    }
  override init(){
    super.init()
    }

}
