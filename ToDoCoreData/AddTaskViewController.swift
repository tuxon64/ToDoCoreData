//
//  AddTaskViewController.swift
//  ToDoCoreData
//
//  Created by Todd L Mathews on 12/13/16.
//  Copyright © 2016 Todd L Mathews. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var isImp: UISwitch!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func pressBT(_ sender: Any)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = textField.text!
        task.isImportant = isImp.isOn
        textField.text = ""
        
        //Save the data to coredata
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
 //       navigationController?.popViewController(animated: true)
        
    
    }
   
}
