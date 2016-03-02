//
//  TaskModel.swift
//  To-Do List
//
//  Created by Ruihan Zhao on 2/23/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit
var completed =  [String]()


class TaskModel: NSObject {
    var tasks = [String]()
    var stringDict: [String : ToDoCell] = [String : ToDoCell]()
    func addItem(task : String) {
        tasks.append(task);

    }
    func completeItem(var tasks : [String], task : String) {
        var index = 0;
        var finalIndex = 0;
        for item in tasks {
            if (item == task) {
                finalIndex = index;
                break;
            }
            index += 1;
        }
        tasks.removeAtIndex(finalIndex);
    }
    
}
