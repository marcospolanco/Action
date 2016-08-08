//
//  ActionTableViewController.swift
//  Action
//
//  Created by Marcos Polanco on 8/7/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//

import UIKit
import SwiftDate

class ActionTableViewController: UITableViewController {
    
    var actions = [Action]()
    
    /* Create a new action item
    */
    @IBAction func add() {
        self.actions.append(Action())
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load the database into memory
        self.actions = Database.actions()
    }
}

extension ActionTableViewController  { //UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.actions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ActionTableViewCell.reuseIdentifier, forIndexPath: indexPath) as! ActionTableViewCell
        cell.load(self.actions[indexPath.row])
        return cell
    }
    

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            //delete the object in the database
            Database.delete(self.actions[indexPath.row])
            
            //delete the object in memory
            self.actions.removeAtIndex(indexPath.row)
            
            //reload the view layer accordingly
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}

extension ActionTableViewController  { //UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}

class ActionTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ActionTableViewCell"
    
    //track the action we are displaying, as we need to act on it.
    var action: Action?
    
    @IBOutlet weak var dueDate: UIButton!
    @IBOutlet weak var comments: UITextField!
    
    override func prepareForReuse() {
        
    }

    @IBAction func updateDueDate(sender: AnyObject) {
        DatePickerDialog().show("Due Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .Date) {date in
            if let date = date {
                
                //update the data
                self.action?.dueDate = date
                
                //save it in the database
                Database.save()
                
                //refresh the cell
                self.refresh()
            }
        }
    }
    
    @IBAction func updateComments(sender:AnyObject) {
    
    }
    
    //format the date as desired, using just month and day and appending zero. Use NSDateFormatter?
    private func dateFormat(date: NSDate?) -> String {
        guard let date = date else {fatalError()} //FIX - at thsi point, we must have non-nil data here.
        
        let month = date.month < 10 ? "0\(date.month)" : "\(date.month)"
        let day = date.day   < 10 ? "0\(date.day)" : "\(date.month)"
        return "\(month)/\(day)"
    }
    
    private func refresh() {
        self.dueDate.setTitle(self.dateFormat(action?.dueDate!), forState: .Normal)//FIX - force unwrap
        self.comments.text = action?.comments
    }
    
    //load the cell labels with data from the action object
    func load(action: Action) {
        self.action = action
        self.refresh()
    }
}

extension ActionTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //populate the action with the comment
        self.action?.comments = textField.text
        
        //save the database
        Database.save()
        
        //resign first responder to hide keyboard
        textField.resignFirstResponder()
        
        return true
    }
}
