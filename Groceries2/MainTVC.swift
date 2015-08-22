//
//  MainTVC.swift
//  Groceries2
//
//  Created by Ebony Nyenya on 8/20/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

class MainTVC: UIViewController, UITableViewDataSource, UITableViewDelegate, sendItemToTVC {
    
    
    @IBOutlet weak var tableView: UITableView!

    var itemsArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        if let list = NSUserDefaults.standardUserDefaults().objectForKey("groceryList") as? [String] {
            
            itemsArray = list
            
            tableView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if section == 1 {
            return itemsArray.count
           
        }
            return 1
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("addCell", forIndexPath: indexPath) as! AddItemCell
            
            cell.delegate = self
            
            cell.groceryItemFld.becomeFirstResponder()
            
            return cell
        }
        
        else {
            
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = itemsArray[indexPath.row]
        
        return cell
            
        }
    }
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            itemsArray.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(itemsArray, forKey: "groceryList")
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if indexPath.section == 0 {
            
            return false
            
        } else {
            
            return true
        }
    }
    
    
    func addItemToArray(item: String) {
        
        itemsArray.append(item)
        
        NSUserDefaults.standardUserDefaults().setObject(itemsArray, forKey: "groceryList")
        
        tableView.reloadData()
        
    }
    
    
    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    


}
