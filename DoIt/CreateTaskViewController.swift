//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Alejandro Diaz Sotolongo on 4/25/21.
//  Copyright © 2021 aaaa. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    //@IBOutlet weak var taskNameTextField: UITextField!
    //@IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextFiled: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBAction func addtapped2(_ sender: Any) {
        let task = Tak()
        task.name = taskNameTextFiled.text!
        task.important = importantSwitch.isOn
        print(taskNameTextFiled.text!)
        print(importantSwitch.isOn)
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}
