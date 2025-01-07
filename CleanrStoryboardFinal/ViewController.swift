//
//  ViewController.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/5/25.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func tappedLoginButton(_ sender: Any) {
    }
    
    //@IBOutlet var tableView: UITableView!//This connects the storyboard to this file and makes it accessible in this file as tableView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //self.title = "Home"
        //usernameField.delegate = self
        //passwordField.delegate = self
        
        
        //Initialize a StateObject, to create the original TaskList
        //@StateObject var taskList = TaskList() //TODO: Removed this line to remove error from old attempt.
        
        //tableView.delegate = self
        //tableView.dataSource = self
        
        // Get all current saved Tasks.
        //updateTasks() */
    }
    
    /*
    @IBAction func didTapAdd() {//This function sends the user to a storyboard to create a new task when they tap the + button at the top right.
        
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
    }//End of didTapAdd()*/
    
    func register() {
        guard let username = usernameField.text else {
            return
        }
        guard let password = passwordField.text else {
            return
        }
        Auth.auth().createUser(withEmail: username, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }//End of register()
    
    func login() {
        guard let username = usernameField.text else {
            return
        }
        guard let password = passwordField.text else {
            return
        }
        Auth.auth().signIn(withEmail: username, password: password) { result, error in if error != nil {
                print(error!.localizedDescription)
            }
        }
    }//End of login()
}//End of ViewController

/*
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
*/

/*
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Here we dequeue a cell, which means we will be swapping out the text of a cell so that we don't have to swap out entire cells during displaying cells.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Set the text label for the cell based on its IndexPath
                
        return cell
    }
}
*/
