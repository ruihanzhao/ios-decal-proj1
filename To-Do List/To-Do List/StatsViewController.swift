//
//  StatsViewController.swift
//  To-Do List
//
//  Created by Ruihan Zhao on 2/23/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet var stats: UIViewController!
    @IBOutlet weak var statsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStats()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        displayStats()
    }
    func displayStats() {
        let numCompleted = completed.count
        let number = String(numCompleted)
        statsLabel.text = number
   

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
