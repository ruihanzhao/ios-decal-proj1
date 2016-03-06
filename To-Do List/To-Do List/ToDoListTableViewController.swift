//
//  ViewController.swift
//  To-Do List
//
//  Created by Ruihan Zhao on 2/23/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    var tasks = TaskModel();
    var isTrash: Bool = false
    @IBOutlet var add: UIButton!
    @IBOutlet var taskTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToToDoListTableViewController(segue : UIStoryboardSegue) {
        
    }
    
    func addTask(text : String) {
        if (text != "") {
            print("text being added to tasks: \(text)")
            tasks.addItem(text)
        }
    }

    override func viewWillAppear(animated: Bool) {
        taskTable.reloadData()
        checkTasks()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToAddReminder" {
            let addVC = segue.destinationViewController as! AddReminderViewController
//            addVC.tasks = self.tasks
        }

    }
    func checkTasks() {
        for (var i = 0; i < completed.count; i++) {
            let name = completed[i]
            let currCell = tasks.stringDict[name]
            let oldDate = currCell!.time
            if ((NSCalendar.currentCalendar().components(.Hour, fromDate: oldDate , toDate: NSDate(), options:[]).hour) >= 24) {
                completed.removeAtIndex(i)
                tasks.tasks.removeAtIndex(i)
            }
        }
        taskTable.reloadData()
    }
    
    func getDate(cell : ToDoCell) {
        let todaysDate:NSDate = NSDate()
        cell.time = todaysDate
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.tasks.count;
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tasks.tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoCell
        cell.ToDoLabel.text = tasks.tasks[indexPath.row]
        tasks.stringDict[tasks.tasks[indexPath.row]] = cell
        if (cell.completed == true) {
            cell.accessoryType = .Checkmark
        }
        if (!cell.completed) {
            cell.accessoryType = .None
        }
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let cell = tasks.stringDict[tasks.tasks[indexPath.row]]!
//        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoCell
        if (cell.completed) {
            var finalIndex = 0
            var index = 0
            for item in completed {
                if item == tasks.tasks[indexPath.row] {
                    finalIndex = index
                    break
                }
                else {
                    index+=1
                }
            }
            completed.removeAtIndex(finalIndex)
            cell.completed=false
            tableView.reloadData()
            return;
        }
        if (!cell.completed) {
            completed.append(tasks.tasks[indexPath.row])
            getDate(cell);
        }
        cell.completed = true
        tableView.reloadData()
//        tasks.tasks.removeAtIndex(indexPath.row)
        
        
    }

    
}

