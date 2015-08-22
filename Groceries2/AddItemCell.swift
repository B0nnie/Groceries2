//
//  AddItemCell.swift
//  Groceries2
//
//  Created by Ebony Nyenya on 8/20/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

protocol sendItemToTVC {
    func addItemToArray(item: String)
}

class AddItemCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate : sendItemToTVC?
    
    @IBOutlet weak var groceryItemFld: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       groceryItemFld.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        addItemToList()
        
    }
    
    //return button on keyboard to add textfield entry to array
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        
      addItemToList()
        return false
    }

    
    func addItemToList(){
        
        if groceryItemFld.text == "" {
            
            let alertView = UIAlertView(title: "Error", message: "Please enter a grocery item", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            delegate?.addItemToArray(groceryItemFld.text)
            
            groceryItemFld.text = ""
        }
        
    }

}
