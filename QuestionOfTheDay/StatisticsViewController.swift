//
//  StatisticsViewController.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/6/17.
//

import UIKit

class StatisticsViewController: UITabBarController {
    
    //Outlets...
    @IBOutlet weak var questionLBL: UILabel!
    
    @IBOutlet weak var answer1LBL: UILabel!
    @IBOutlet weak var answer2LBL: UILabel!
    @IBOutlet weak var answer3LBL: UILabel!
    
    @IBOutlet weak var answer1PercentLBL: UILabel!
    @IBOutlet weak var answer2PercentLBL: UILabel!
    @IBOutlet weak var answer3PercentLBL: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.navigationItem.title = "Statistics"
        
        let question = Statistician().fetchQuestionOfTheDay()
        
        questionLBL.text = "\(String(describing: question.question))"
        answer1LBL.text = "\(String(describing: question.answer0))"
        answer2LBL.text = "\(String(describing: question.answer1))"
        answer3LBL.text = "\(String(describing: question.answer2))"


        let percents = Statistician().findPercentage
        answer1PercentLBL.text = "\(percents()[0])"
        answer2PercentLBL.text = "\(percents()[1])"
        answer3PercentLBL.text = "\(percents()[2])"

        
        
        // Do any additional setup after loading the view.
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
