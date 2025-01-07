//
//  TaskViewController.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/5/25.
//

import UIKit
class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    //Create a void variable to assign so that we can update the viewcontroller, which happens any time a variable is assigned
    var update: (() -> Void)?
    
    var task: String?
    var indexPath: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        //Assign indexPath
        //indexPath =
        //print("indexPath: ")
        //print(indexPath)
        
        //Get the indexNum from indexPath, since indexPath is stored as a tuple
        //let indexNum = indexPath.max() FIXME: This is the last line I had uncommented.
        //print("indexNum: ")
        //print(indexNum!)
        
        //Get the pre-deletion count for number of values in string
        /*guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }*/
        
        
        
        
        //Delete the Task we want to delete. We have to type cast the indexNum as a string in order for the key to function properly.
        //print(UserDefaults().value(forKey: "count") as Any)
        
        
        //THIS IS THE LINE I EDITTED OUT LAST vv
        //UserDefaults().removeObject(forKey: indexPath)
        
        
        
        
        //UserDefaults().removeObject(forKey: "task_\(indexPath)")
        //UserDefaults().removeObject(forKey: "task_\(indexNum)")
        //UserDefaults().removeObject(forKey: "task_\(String(describing: indexNum))")
        
        //print(UserDefaults().value(forKey: "count") as Any)
        
        //Shrink UserDefaults.value count by 1 because we deleted an item
        //UserDefaults().set((count - 1), forKey: "count")
        
        //If the update() function exists, call it. This forces tableView to update.
        update?()
        
        //Pop over to the ViewController screen since we're done with deleting the task.
        navigationController?.popViewController(animated: true)
        
        
        
        
        //Actually, going forwards through the array, any time the last digit doesn't
        //Going backwards thru the array, iterate thru each item. If the newCount is less than the Index (-1 for every item it's seen), then keep going, changing the key "task_\(newCount)" as you go. Once reaching an index that is equal to the newCount, return. This will theoretically work as long as removeObject really did remove the item in the array, because there would be a gap.
        
        //Set value at key to something else
        //Iterate thru the array, keeping track of the last two items looked at. If the second item's key is not the count+1 of the previous item, set the second item's data (text/key) to be the data of the next item. Wait, actually, that still leaves extra junk items that will just sit at the end of the array, further messing up the Count that we're using.
        
        
        
        
        /*
        let newCount = count - 1
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(count)") */
    }
}//End of TaskViewController class
