//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/5/17.
//

import Foundation
var opinions = databaseManager.retrieveAllOpinions()

class Statistician{
     func findPercentage() -> [Double]{
        var results:[Double] = [0.0, 0.0, 0.0]
        var numA:Double = 0.0
        var numB:Double = 0.0
        var numC:Double = 0.0
        var total:Double = 0.0
        
        for a in opinions{
            if a.answer == 0{
                numA += 1.0
            }
            if a.answer == 1{
                numB += 1.0
            }
            if a.answer == 2{
                numC += 1.0
            }
            total += 1.0
        }
        results[0] = numA / total
        results[1] = numB / total
        results[2] = numC / total
        
        return results
    }
    
    func fetchQuestionOfTheDay() -> QuestionOfTheDay{
        var questions = databaseManager.retrieveQuestionOfTheDay()
        return questions[0]
    }
    
    func saveOpinion(_ opinion:Opinion) -> Void{
        databaseManager.saveOpinion(opinion: opinion)
    }
    
}
