//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by Varun on 30/01/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBOutlet var txtRollNO : UITextField!
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtMarks : UITextField!

    var appdelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    @IBAction func saveButtonPressed(_ sender : UIButton) {
        
        if appdelegate.executeQuery("INSERT INTO Student (roll_no, name, marks) VALUES ('\(txtRollNO.text!)','\(txtName.text!)', '\(txtMarks.text!)')") {
            print("Saved")
            self.navigationController?.popViewController(animated: true)
        }
        else {
            print("Failed to save")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

