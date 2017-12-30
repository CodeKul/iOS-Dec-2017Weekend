//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by Varun on 30/12/17.
//  Copyright © 2017 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var arrData1 : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrData1 = ["Red", "Green", "Blue", "Yellow", "Magenta", "Cyan", "Brown", "Gray", "White", "Black"]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrData1!.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrData1?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("\(arrData1![row])")
        
    }
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        
        let df = DateFormatter()
        df.dateFormat = "E, d MMM yyyy hh:mm:ss a"
        
        print("\(df.string(from: sender.date))")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

