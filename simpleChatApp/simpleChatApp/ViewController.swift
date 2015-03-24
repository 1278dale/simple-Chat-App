//
//  ViewController.swift
//  simpleChatApp
//
//  Created by Dale Stevens on 23/03/2015.
//  Copyright (c) 2015 Dale Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var dockViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    var messagesArray:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self
        
        // set self as delegate for text field
        self.messageTextField.delegate = self
        
        // Add some sample data so that we can see something
        self.messagesArray.append("Test1")
        self.messagesArray.append("Test2")
        self.messagesArray.append("Test3")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendButtonTap(sender: UIButton) {
        
        //send button is tapped
        
        
        
    }
    
    // MARK: TextField Delegate Methods
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        //perform an animation to grow the dock view

        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            
            self.dockViewHeightConstraint.constant = 400
            self.view.layoutIfNeeded()
            
            }, completion: nil)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            
            self.dockViewHeightConstraint.constant = 60
            self.view.layoutIfNeeded()
            
            }, completion: nil)
    }
    
    
    // MARK: TableView Delegate Methods
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Create a table cell
        let cell = self.messageTableView.dequeueReusableCellWithIdentifier("MessageCell") as UITableViewCell
        
        
        //Customise the cell
        cell.textLabel?.text = self.messagesArray[indexPath.row]
        
        
        //Return the cell
        return cell

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }

}

