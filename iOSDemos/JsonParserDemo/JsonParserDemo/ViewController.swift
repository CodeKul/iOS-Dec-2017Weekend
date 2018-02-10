//
//  ViewController.swift
//  JsonParserDemo
//
//  Created by Varun on 10/02/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrData : [State]?
    
    @IBOutlet var loader : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.arrData = [State]()
    }

    @IBAction func getDataForIND (_ sender : UIButton) {
        
        getDataFromWebServiceWith(countryName: "IND")
    }

    @IBAction func getDataForUSA (_ sender : UIButton) {
        
        getDataFromWebServiceWith(countryName: "USA")
    }

    func getDataFromWebServiceWith (countryName : String) {
        
        self.arrData = [State]()
        loader.startAnimating()
        let strUrl = "http://services.groupkt.com/state/get/\(countryName)/all"
        let urlReq = URLRequest(url: URL(string: strUrl)!)
        let dataTask = URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
            
            if error == nil {
                let dataResponse = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
                let restResponse = dataResponse["RestResponse"] as! [String : Any]
                let results = restResponse["result"] as! [[String : Any]]
                
                for state in results {
                    let s = State(country: state["country"] as! String, name: state["name"] as! String, abbr: state["abbr"] as! String, area: state["area"] as! String, largest_city: state["largest_city"] as! String, capital: state["capital"] as! String)
                    self.arrData?.append(s)
                }
                
                DispatchQueue.main.async {
                    self.loader.stopAnimating()
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StatesTableViewController") as! StatesTableViewController
                    vc.arrStates = self.arrData
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
        dataTask.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

