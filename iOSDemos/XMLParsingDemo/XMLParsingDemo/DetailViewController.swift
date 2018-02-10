//
//  DetailViewController.swift
//  XMLParsingDemo
//
//  Created by Varun on 10/02/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var commonLbl : UILabel!
    @IBOutlet var botnicalLbl : UILabel!
    @IBOutlet var zoneLbl : UILabel!
    @IBOutlet var lightLbl : UILabel!
    @IBOutlet var priceLbl : UILabel!
    @IBOutlet var availabilityLbl : UILabel!

    var dictData : [String : String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        commonLbl.text = dictData!["COMMON"]
        botnicalLbl.text = dictData!["BOTANICAL"]
        zoneLbl.text = dictData!["ZONE"]
        lightLbl.text = dictData!["LIGHT"]
        priceLbl.text = dictData!["PRICE"]
        availabilityLbl.text = dictData!["AVAILABILITY"]
        
    }

    @IBAction func doneButtonPressed(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
