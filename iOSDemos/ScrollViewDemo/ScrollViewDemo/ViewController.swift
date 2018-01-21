//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Varun on 06/01/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var contentView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = contentView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

