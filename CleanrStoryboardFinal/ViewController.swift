//
//  ViewController.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!//This lets us control the tableview from the storyboard
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        
        //Initialize a StateObject, to create the original TaskList
        //@StateObject var taskList = TaskList() //TODO: Removed this line to remove error from old attempt.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        // Get all current saved Tasks.
        updateTasks()
    }
    
    func updateTasks() {
        //Start fresh with an empty array
        tasks.removeAll()
        
        //Add the tasks from the database
        
        
        //Reload the data so the user sees it after the changes
        tableView.reloadData()
    }
    
    @IBAction func didTapAdd() {//This function sends the user to a storyboard to create a new task
        
        //Instantiate the EntryViewController
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        
        //Add a title to the EntryViewController
        vc.title = "New Task"
        
        //Update the table so it's accurate
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        
        //Now that the EntryViewController is ready, push the user to its screen
        navigationController?.pushViewController(vc, animated: true)
    }//End of didTapAdd()
}//End of ViewController

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Stop selecting the row that was selected
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Instantiate the EntryViewController
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        
        //Add a title to the EntryViewController
        vc.title = "New Task"
        //vc.task = tasks[indexPath.row]
        //vc.indexPath = indexPath
        
        //Now that the EntryViewController is ready, push the user to its screen
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Here we dequeue a cell, which means we will be swapping out the text of a cell so that we don't have to swap out entire cells during displaying cells.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Set the text label for the cell based on its IndexPath
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
