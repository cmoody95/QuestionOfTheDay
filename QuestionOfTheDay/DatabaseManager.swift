//
//  DatabaseManager.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/6/17.
//

// https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift/

import Foundation

let databaseManager:DatabaseManager = DatabaseManager() // um, this is novel ...


// Note: We use both asynchronous and synchronous methods here.
// In some cases, we use Backendless' asynchronous method calls, with response and error closures
// In others, we demonstrate how to use Apple's DispatchQueue to accomplish the same thimg
// Whenever using asynchronous calls, we need to somehow make the classes that rely on the DatabaseManager
// aware of when they have completed. To this end, we broadcast two messages -- "Add New Bird" and "Add New County"
// so that when the TableViewControllers receive these, they know to reload their data.

// Having problems? If Backendless is throwing a fault, use Types.tryblock(<#T##tryblock: (() -> Void)!##(() -> Void)!##() -> Void#>, catchblock: <#T##((Any?) -> Void)!##((Any?) -> Void)!##(Any?) -> Void#>), and in the catchblock, print out the fault to get details. Otherwise, ask Joel 😎


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
    func saveQuestionOfTheDay(question:QuestionOfTheDay){
        
        dataStoreQuestionOfTheDay?.save(question,
                               response: {(result) in NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Question saved"), object: nil)},
                               error: {(fault:Fault?)->Void in print("\(String(describing: fault)) happened while saving QuestionOfTheDay)")})
    }
    
    
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
    func retrieveQuestionOfTheDay() ->[QuestionOfTheDay]{
        
        let numQuestionsToFetch = dataStoreQuestionOfTheDay?.getObjectCount() as! Int
        let pageSize = 10
        let queryBuilder = DataQueryBuilder()
        var numQuestionsFetched = 0
        var allQuestions:[QuestionOfTheDay] = []
        queryBuilder!.setPageSize(Int32(pageSize)).setOffset(0)
        
        while numQuestionsFetched < numQuestionsToFetch {
            let questions = self.dataStoreQuestionOfTheDay?.find(queryBuilder) as! [QuestionOfTheDay]
            allQuestions += questions
            numQuestionsFetched += questions.count
            queryBuilder!.prepareNextPage()
        }
        return allQuestions
    }
    
    
    
}


