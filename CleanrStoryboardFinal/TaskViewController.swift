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
        
        //label.text = task
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        //Delete the task TODO: IMPLEMENT THIS FUNCTION
        
        
        //Pop over to the ViewController screen since we're done with deleting the task.
        navigationController?.popViewController(animated: true)
    }
}//End of TaskViewController class
