//
//  Opinion.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/5/17.
//

import Foundation
@objcMembers
class Opinion : NSObject{
    var created: NSDate?
    var updated: NSDate?
    var objectId: String?
    var question:QuestionOfTheDay?
    var answer:Int
    
    init( answer:Int){
        self.answer = answer
    }
    convenience override init(){
        self.init(answer: 0)
    }
}
