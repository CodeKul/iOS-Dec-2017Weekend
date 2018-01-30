//
//  StuTableViewController.swift
//  SQLiteDemo
//
//  Created by Varun on 30/01/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import SQLite3

class StuTableViewController: UITableViewController {

    private var arrData : Array<Dictionary<String, String>>?
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrData = appDelegate.selectQuery("SELECT roll_no, name, marks FROM Student")
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrData!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stuCell")
        
        let dict = arrData![indexPath.row]
        cell?.textLabel?.text = "\(dict["roll_no"]!) - \(dict["name"]!)"
        cell?.detailTextLabel?.text = dict["marks"]!
        
        return cell!
    }
}
