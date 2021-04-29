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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBAction func addtapped2(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        
        task.name = taskNameTextFiled.text!
        task.important = importantSwitch.isOn
        print(taskNameTextFiled.text!)
        print(importantSwitch.isOn)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController?.popViewController(animated: true)
    }
    
}
