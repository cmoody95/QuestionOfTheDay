//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/7/17.
//

import UIKit

class VoteViewController: UIViewController {
    @IBOutlet weak var questionLBL: UILabel!
    @IBOutlet weak var answer1LBL: UILabel!
    @IBOutlet weak var answer2LBL: UILabel!
    @IBOutlet weak var answer3LBL: UILabel!
    @IBAction func answer1BTTN(_ sender: Any) {
        databaseManager.saveOpinion(opinion: Opinion( answer: 0) )
    }
    @IBAction func answer2BTTN(_ sender: Any) {
        databaseManager.saveOpinion(opinion: Opinion( answer: 1) )
    }
    @IBAction func answer3BTTN(_ sender: Any) {
        databaseManager.saveOpinion(opinion: Opinion( answer: 2) )
    }
    var questionOfTheDay = Statistician().fetchQuestionOfTheDay

    override func viewDidLoad() {
        
        let question = databaseManager.retrieveQuestionOfTheDay()
        
        questionLBL.text = "\(question.question!)"
        answer1LBL.text = "\(question.answer0!)"
        answer2LBL.text = "\(question.answer1!)"
        answer3LBL.text = "\(question.answer2!)"

        super.viewDidLoad()
        
        
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
