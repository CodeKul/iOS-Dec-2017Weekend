//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by Varun on 10/02/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDataSource, UITableViewDelegate {

    var xmlParser : XMLParser?
    var arrCatalog : [[String : String]]?
    var dictPlant : [String : String]?
    var strData : String?
    
    @IBOutlet var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        xmlParser = XMLParser(contentsOf: URL(string: "https://www.chilkatsoft.com/xml-samples/plants.xml")!)
        
        xmlParser?.delegate = self
        
        xmlParser?.parse()
    }

    func parserDidStartDocument(_ parser: XMLParser) {
        print("parserDidStartDocument")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "CATALOG" {
            arrCatalog = Array<[String : String]>()
        }
        else if elementName == "PLANT" {
            dictPlant = [String : String]()
        }
        else {
            strData = String()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strData?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "CATALOG" {
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
        else if elementName == "PLANT" {
            arrCatalog?.append(dictPlant!)
        }
        else {
            dictPlant![elementName] = strData!
        }
    }
    
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("parserDidEndDocument")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrCatalog!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = arrCatalog![indexPath.row]["BOTANICAL"]
        cell?.detailTextLabel?.text = arrCatalog![indexPath.row]["PRICE"]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        vc.dictData = arrCatalog![indexPath.row]
        
        self.present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

