//
//  StuTableViewController.swift
//  CoreDataDemo
//
//  Created by Varun on 29/01/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import CoreData
class StuTableViewController: UITableViewController {

    var arrData : [Student]?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func viewWillAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        arrData = try! (context.fetch(req) as! [Student])
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard arrData != nil else {
            return 0
        }
        return (arrData?.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let stu = arrData![indexPath.row]
        
        cell.textLabel?.text = stu.roll_no! + " - " + stu.name!
        cell.detailTextLabel?.text = stu.marks!
        
        return cell
    }
}
