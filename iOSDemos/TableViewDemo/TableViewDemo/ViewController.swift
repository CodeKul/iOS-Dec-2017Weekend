//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Varun on 31/12/17.
//  Copyright © 2017 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrData1 : [String]?
    var arrData2 : [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        arrData1 = ["Red", "Green", "Blue", "Yellow", "Cyan", "Magenta", "Gray", "White", "Black", "Brown"]
        arrData2 = ["Sachin", "Virat", "Dhoni", "Yuvraj", "Zahir", "Sehwag"]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return (arrData1?.count)!
        }
        return (arrData2?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = arrData1![indexPath.row]
        }
        else {
            cell?.textLabel?.text = arrData2![indexPath.row]
        }
        return cell!
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == 0 {
            return "Title:Colors"
        }
        else {
            return "Title:Players"
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
//        if section == 0 {
//            lbl.text = "Colors"
//        }
//        else {
//            lbl.text = "Players"
//        }
//        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        lbl.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
//
//        return lbl
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

