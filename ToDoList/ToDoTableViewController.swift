//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Samuel Doherty on 11/20/14.
//  Copyright (c) 2014 home. All rights reserved.
//

import UIKit

// To add items to this array from other views declare it outside of your class so it is global

var ourTodos:[Todo] = []

// Add UITableViewDataSource and UITableViewDelegate and connect them in story board

class ToDoTableViewController: UITableViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var taskTable:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up inital tasks via hard coding
        var item1 = Todo()
        var item2 = Todo()
        var item3 = Todo()
        
        
        item1.task = "Buy Milk"
        item2.task = "Take the dog for the walk"
        item3.task = "Dancing lessons"
        
        ourTodos.append(item1)
        ourTodos.append(item2)
        ourTodos.append(item3)

 
    }
    
    // This method is used for when this view is called again the data will be reloaded and udpated. if not used view will not change with things are added
    
    override func viewWillAppear(animated: Bool) {
        taskTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return ourTodos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create a cell from the identifier from the cell added to the table
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        // create a new Todo
        var selectedTodo = Todo()
        selectedTodo = ourTodos[indexPath.row]
        
        // Add the task to the label
        cell.textLabel.text = selectedTodo.task
        
        // Handle checked for completed or not
        if selectedTodo.completed {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        
        return cell
        
    }
    // WHen user clicks on the cell it toggles completed and adds check mark
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var tappedItem = ourTodos[indexPath.row] as Todo
        
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadData()
    }
    
    // This functino is used to swipe delete tasks
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            ourTodos.removeAtIndex(indexPath.row)
            taskTable.reloadData()
        }
    }
        
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
