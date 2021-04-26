//
//  TasksViewController.swift
//  DoIt
//
//  Created by Alejandro Diaz Sotolongo on 4/24/21.
//  Copyright © 2021 aaaa. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Tak] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //first seque
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
             cell.textLabel?.text = "❗️\(task.name)"
        } else {
             cell.textLabel?.text = task.name
        }
        return cell
    }
    
//second seque
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectTaskSeque", sender: task)
    }
    
    func makeTasks() -> [Tak] {
        let task1 = Tak()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Tak()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Tak()
        task3.name = "Mow the lawn"
        task3.important = false
  
        return [task1, task2, task3]
    }
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSeque", sender: nil)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = seque.destination as!
            CreateTaskViewController
        nextVC.previous = self
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSeque" {
            let nextVC : CreateTaskViewController = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSeque" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Tak
            nextVC.previousVC = self

        }
        /*let nextVC = segue.destination as! UINavigationController
        let nextVC2 = nextVC.topViewController as! CreateTaskViewController
        nextVC2.previousVC = self*/
        
          
    }
    
    
}

