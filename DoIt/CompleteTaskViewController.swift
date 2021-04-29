//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Alejandro Diaz Sotolongo on 4/25/21.
//  Copyright © 2021 aaaa. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var task : Task? = nil
    var previousVC = TasksViewController()

    
    @IBOutlet weak var completeTask: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task!.important {
            completeTask?.text = "❗️\(task!.name!))"
              } else {
                   completeTask?.text = task!.name!
              }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTaskk(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
