//
//  AddViewController.swift
//  ToDoList
//
//  Created by Samuel Doherty on 11/20/14.
//  Copyright (c) 2014 home. All rights reserved.
//

import UIKit
// Add UITextFieldDelegate and connect it in story board so you can dismiss the keyboard
class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskTextField: UITextField!
    
    var myTask:Todo = Todo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        // creates a new task
        myTask.task = taskTextField.text
        
        // add new task to our todo array
        ourTodos.append(myTask)
        
        // pop off the view controller to go back to the first one
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    // pops off view without saving any data

    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //This will dismiss the keyboard when enter is selected
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // This will dismiss the keyboard when the view is clicked
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    /*ss
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
