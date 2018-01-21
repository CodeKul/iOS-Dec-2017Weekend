//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Varun on 06/01/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var myWebView : WKWebView!
    @IBOutlet var progressView : UIProgressView!
    @IBOutlet var txtURL : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goButtonPressed (_ sender : UIButton) {
        
        let strURL = txtURL.text
        
        let url = URL(string: strURL!)
        let req = URLRequest(url: url!)
        myWebView.load(req)
        
        myWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            
            txtURL.text = myWebView.url?.absoluteString
            progressView.isHidden = false
            progressView.progress = Float(myWebView.estimatedProgress)
            if progressView.progress == 1 {
                progressView.isHidden = true
            }
        }
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

