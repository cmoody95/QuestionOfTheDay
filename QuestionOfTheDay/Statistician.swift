//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/5/17.
//

import Foundation

let databaseManager:DatabaseManager = DatabaseManager() // um, this is novel ...


class DatabaseManager {
    
    let APPLICATION_ID = "EDC84C5E-00DC-2D93-FFC6-0708BF6D7C00"
    let API_KEY = "22D5AC3C-6EB8-C790-FFB1-69AEB3B6D600"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var dataStoreOpinion:IDataStore!
    var dataStoreQuestionOfTheDay:IDataStore!

    
    
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
        dataStoreQuestionOfTheDay = backendless.data.of(QuestionOfTheDay.ofClass())
    }
    
    
    
    // Adds a County --
    // When a new County has been added, broadcast the fact so the CountyTableViewController will know to reload its data
    // We do this because we have elected to save the County asynchronously
    // This method will therefore return, and the AddNewCountyViewController will have dismissed
    // itself, *before* the new County has been saved
    func saveOpinion(opinion answer:Opinion){
        
        
            dataStoreOpinion?.save(Opinion(answer),
                                  response: {(result) in NotificationCenter.default.post(name: NSNotification.Name(rawValue: "New County Added"), object: nil)},
                                  error: {(fault:Fault?)->Void in print("\(String(describing: fault)) happened while saving a County)")})
        
        
    }
    
}

class Statistician{
    func findPercentage()-> [Double]{
        return [0.0]
    }
    func fetchQuestionOfTheDay() -> String{
        return ""
    }
    func saveOpinion(_ opinion:Opinion, to question:QuestionOfTheDay) -> Void{
        
    }
    
}
