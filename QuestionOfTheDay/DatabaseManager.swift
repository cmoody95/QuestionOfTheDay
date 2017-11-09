//
//  DatabaseManager.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/6/17.
//

// https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift/

import Foundation

let databaseManager:DatabaseManager = DatabaseManager()


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
    func saveOpinion(opinion answer:Opinion){
        
        dataStoreOpinion?.save(answer,
                               response: {(result) in NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Opinion saved"), object: nil)},
                               error: {(fault:Fault?)->Void in print("\(String(describing: fault)) happened while saving an Opinion)")})
    }
    //    func saveQuestionOfTheDay(question:QuestionOfTheDay){
    //
    //        dataStoreQuestionOfTheDay?.save(question,
    //                               response: {(result) in NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Question saved"), object: nil)},
    //                               error: {(fault:Fault?)->Void in print("\(String(describing: fault)) happened while saving QuestionOfTheDay)")})
    //    }
    
    
    func retrieveAllOpinions() ->[Opinion]{
        
        let numOpinionsToFetch = dataStoreOpinion?.getObjectCount() as! Int
        let pageSize = 10
        let queryBuilder = DataQueryBuilder()
        var numOpinionsFetched = 0
        var allOpinions:[Opinion] = []
        queryBuilder!.setPageSize(Int32(pageSize)).setOffset(0)
        
        while numOpinionsFetched < numOpinionsToFetch {
            let opinions = self.dataStoreOpinion?.find(queryBuilder) as! [Opinion]
            allOpinions += opinions
            numOpinionsFetched += opinions.count
            queryBuilder!.prepareNextPage()
        }
        return allOpinions
    }
    
    func retrieveQuestionOfTheDay() ->QuestionOfTheDay{
        
        let question = self.dataStoreQuestionOfTheDay?.findFirst() as! QuestionOfTheDay
        return question
    }
    
    
    
}


