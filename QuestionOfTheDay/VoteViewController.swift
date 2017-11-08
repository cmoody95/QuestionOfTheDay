//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by Chris Moody  on 11/6/17.
//

import UIKit

class VoteViewController: UITabBarController {

    @IBOutlet weak var questionLBL: UILabel!
    @IBOutlet weak var answer1LBL: UILabel!
    @IBOutlet weak var answer2LBL: UILabel!
    @IBOutlet weak var answer3LBL: UILabel!
    
    @IBAction func answer1BTTN(_ sender: Any) {
    }
    @IBAction func answer2BTTN(_ sender: Any) {
    }
    @IBAction func answer3BTTN(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vote!"

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
