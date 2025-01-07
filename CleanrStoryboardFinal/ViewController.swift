//
//  ViewController.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    //@EnvironmentObject var taskList: ViewControllerModel
    
    
    let taskList: TaskList
    
    init?(taskList: TaskList, coder: NSCoder) {
        self.taskList = taskList
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        //super.init(coder: coder)
        fatalError("init(coder:) has not been implemented.")
    }
    
    /*required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }*/
    
    @IBOutlet var tableView: UITableView!//This lets us control the tableview from the storyboard
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        
        //Initialize a StateObject, to create the original TaskList
        @StateObject var taskList = TaskList()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")//Sets the number of tasks to 0
        }
        
        // Get all current saved Tasks.
        updateTasks()
    }
    
    func updateTasks() {
        //Start fresh with an empty array
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        //Iterate for every Task item
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                tasks.append(task)
            }
        }
        
        tableView.reloadData()
    }
    
    @IBAction func didTapAdd() {//This function sends the user to a storyboard to create a new task
        
        taskList.tasks.append("notDefault")
        
        /*
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
        */
    }//End of didTapAdd()
}//End of ViewController

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Instantiate the EntryViewController
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        
        //Add a title to the EntryViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        vc.indexPath = indexPath
        
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
