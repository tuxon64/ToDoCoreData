//
//  ViewController.swift
//  ToDoCoreData
//
//  Created by Todd L Mathews on 12/13/16.
//  Copyright © 2016 Todd L Mathews. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        
        // get the data from core data
        getData()
        //reload the table view
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.isImportant {
            cell.textLabel?.text = "😻 \(task.name!)"
        } else {
            
         cell.textLabel?.text = task.name!
        }
        
        return cell
    }
   
    func getData() {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
        do {
         tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            print("fetched failed")
        }
    
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("fetched failed")
            }

        }
        tableView.reloadData()
    }

}
