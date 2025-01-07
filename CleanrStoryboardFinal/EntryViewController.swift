//
//  EntryViewController.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/5/25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    //Create a void variable to assign so that we can update the viewcontroller, which happens any time a variable is assigned
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        
        return true
    }
    
    func saveTask() {
        guard canSave else {//Verify that saving is possible, and if not, quit this function.
            return
        }
        
        //Get current user ID. If not possible, quit this function.
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        
        
        //Save model
        let db = Firestore.firestore()
        db.Collection("users")
            .document(uid)
            .collection("todos")
            .document("123")
            .setData([:])
    }//End of saveTask()
    
        //Old saveTask() function
        /*
         //@objc func saveTask() {//Setting this to @objc allows the function to be used as a #selector

        guard let text = field.text, !text.isEmpty else {//Assign the text as long as it isn't empty
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        
        //This sets the text of a new task and assigns it a count based on the count of number of items in the list. However, I think this would mean if we reduced that count (such as when we complete a Task), then it would overwrite the data to create a new one replacing the old one.
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        //If the update() function exists, call it. This forces tableView to update.
        update?()
        
        navigationController?.popViewController(animated: true)
    }//End of saveTask()*/
}//End of EntryViewController class
