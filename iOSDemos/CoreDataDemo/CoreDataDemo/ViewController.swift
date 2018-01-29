//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Varun on 29/01/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var txtRollNo : UITextField!
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtMarks : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

    @IBAction func saveButtonClicked (_ sender : UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let obj = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context)
        obj.setValue(txtRollNo.text, forKey: "roll_no")
        obj.setValue(txtName.text, forKey: "name")
        obj.setValue(txtMarks.text, forKey: "marks")

        appDelegate.saveContext()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

