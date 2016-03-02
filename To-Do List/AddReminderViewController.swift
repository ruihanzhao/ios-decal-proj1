//
//  AddReminderViewController.swift
//  To-Do List
//
//  Created by Ruihan Zhao on 2/23/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit

class AddReminderViewController : UIViewController {
//    var tasks : TaskModel?
    @IBOutlet var addText: UITextField!
    @IBOutlet weak var TextBox: UITextField!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toDoViewController = segue.destinationViewController as! ToDoListTableViewController
        toDoViewController.addTask(TextBox.text!)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


}
