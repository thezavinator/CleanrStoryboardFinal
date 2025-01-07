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
    
    var newTaskText = ""
    
    //Create a void variable to assign so that we can update the viewcontroller, which happens any time a variable is assigned
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //TODO: Put a line here to set newTaskText to the user input text
        newTaskText = ""
        saveTask()
        
        return true
    }
    
    func saveTask() {
        /*guard canSave else {//Verify that saving is possible, and if not, quit this function.
            return
        }*/
        
        //Get current user ID. If not possible, quit this function.
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        let newId = UUID().uuidString
        let newTaskItem = TaskListItem(
            id: newId,
            taskText: newTaskText,
            isDone: false,
            isGroupable: false)
        
        //Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)//User's ID
            .collection("todos")//This is a collection created on the Firebase website
            .document("123")//New model ID
            .setData(newTaskItem.asDictionary())//This is setting a dictionary variable
    }//End of saveTask()
}//End of EntryViewController class
