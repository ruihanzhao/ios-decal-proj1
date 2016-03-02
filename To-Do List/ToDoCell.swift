//
//  ToDoCell.swift
//  To-Do List
//
//  Created by Ruihan Zhao on 2/29/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit

class ToDoCell:  UITableViewCell {
    //add cell so we can link the label!!
    
    @IBOutlet weak var ToDoLabel: UILabel!
    var completed: Bool = false
    var time: NSDate!
}
