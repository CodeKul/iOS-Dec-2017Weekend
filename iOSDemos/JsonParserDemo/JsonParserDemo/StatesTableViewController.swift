//
//  StatesTableViewController.swift
//  JsonParserDemo
//
//  Created by Varun on 10/02/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class StatesTableViewController: UITableViewController {

    var arrStates : [State]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backButtonPressed (_ sender : UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrStates!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        cell?.textLabel?.text = arrStates![indexPath.row].name
        cell?.detailTextLabel?.text = arrStates![indexPath.row].capital

        return cell!
    }
}
