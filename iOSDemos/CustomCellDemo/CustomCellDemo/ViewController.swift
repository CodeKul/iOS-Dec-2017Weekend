//
//  ViewController.swift
//  CustomCellDemo
//
//  Created by Varun on 31/12/17.
//  Copyright © 2017 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrPlayers : [[String : Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPlayers = [["name" : "Sachin", "DOB" : "24 Apr", "score" : "10000", "image" : #imageLiteral(resourceName: "Sachin")], ["name" : "Dhoni", "DOB" : "7 July", "score" : "8000", "image" : #imageLiteral(resourceName: "Dhoni")], ["name" : "Virat", "DOB" : "16 July", "score" : "7000", "image" : #imageLiteral(resourceName: "Virat")], ["name" : "Yuvraj", "DOB" : "30 June", "score" : "6000", "image" : #imageLiteral(resourceName: "Yuvraj")]]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (arrPlayers?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as! CustomTableViewCell
        
        let dict = arrPlayers![indexPath.row]
        cell.nameLbl.text = (dict["name"] as! String)
        cell.DOBLbl.text = (dict["DOB"] as! String)
        cell.scoreLbl.text = (dict["score"] as! String)
        cell.profileImageView.image = (dict["image"] as! UIImage)
     
        cell.btnGo.addTarget(self, action: #selector(cellGoButtonPressed), for: .touchUpInside)
        cell.btnGo.tag = indexPath.row
        
        return cell
    }

    @objc func cellGoButtonPressed(_ sender : UIButton) {
        print("Buttonclicked of row: \(sender.tag)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

