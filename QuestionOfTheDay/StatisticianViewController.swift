//
//  StatisticianViewController.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/7/17.
//

import UIKit

class StatisticianViewController: UIViewController {
    @IBOutlet weak var questionLBL: UILabel!
    @IBOutlet weak var answer1LBL: UILabel!
    @IBOutlet weak var answer2LBL: UILabel!
    @IBOutlet weak var answer3LBL: UILabel!
    @IBOutlet weak var a1PercentLBL: UILabel!
    @IBOutlet weak var a2PercentLBL: UILabel!
    @IBOutlet weak var a3PercentLBL: UILabel!
    
    override func viewWillAppear(_ animated: Bool){
        let percents = Statistician().findPercentage()
        a1PercentLBL.text = "\(percents[0] * 100)%"
        a2PercentLBL.text = "\(percents[1] * 100)%"
        a3PercentLBL.text = "\(percents[2] * 100)%"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Statistics"
        let question = databaseManager.retrieveQuestionOfTheDay()
        
        questionLBL.text = question.question!
        answer1LBL.text = question.answer0!
        answer2LBL.text = question.answer1!
        answer3LBL.text = question.answer2!
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
