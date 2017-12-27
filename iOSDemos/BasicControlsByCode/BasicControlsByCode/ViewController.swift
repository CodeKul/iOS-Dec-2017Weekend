//
//  ViewController.swift
//  BasicControlsByCode
//
//  Created by Varun on 24/12/17.
//  Copyright © 2017 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lbl : UILabel?
    var txt : UITextField?
    var swt : UISwitch?
    var slider : UISlider?
    var seg : UISegmentedControl?
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl = UILabel(frame: CGRect(x: 10, y: 20, width: 300, height: 30))
        lbl?.text = "CodeKul"
        lbl?.textColor = #colorLiteral(red: 0.687862937, green: 0.9394627249, blue: 1, alpha: 1)
        lbl?.backgroundColor = UIColor.black
        lbl?.textAlignment = .center
        
        self.view.addSubview(lbl!)
        
        let btn = UIButton(frame: CGRect(x: 110, y: 60, width: 100, height: 30))
        btn.setTitle("GO", for: .normal)
        btn.setTitle("Selected", for: .highlighted)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.view.addSubview(btn)
        
        txt = UITextField(frame: CGRect(x: 10, y: 100, width: 300, height: 30))
        txt?.placeholder = "Name"
        
        self.view.addSubview(txt!)
        
        swt=UISwitch(frame: CGRect(x: 10, y: 150, width: 60, height: 30))
        swt?.isOn=true
        self.view.addSubview(swt!)
        
        swt?.addTarget(self, action: #selector(switchonchange), for: .valueChanged)
        
        slider=UISlider(frame: CGRect(x: 50, y: 200, width: 150, height: 30))
        slider?.minimumValue=50
        slider?.maximumValue=150
        slider?.isContinuous = true
        slider?.addTarget(self, action:#selector(slidervalue), for: .valueChanged)
        
        self.view.addSubview(slider!)
        
        seg=UISegmentedControl(frame: CGRect(x: 10, y: 250, width: 300, height: 30))
        seg?.insertSegment(withTitle: "Red", at: 0, animated:true)
        seg?.insertSegment(withTitle: "Green", at: 1, animated:true)
        seg?.insertSegment(withTitle: "Yellow", at: 2, animated:true)
        self.view.addSubview(seg!)
        seg?.addTarget(self, action: #selector(changeclr), for: .valueChanged)
    }

    @objc func btnClicked(_ sender : UIButton) {
        
        lbl?.text = txt?.text
    }
   @objc func switchonchange(_sender : UISwitch)
    {
        if swt!.isOn
        {
            slider?.isUserInteractionEnabled=true
        }
        else
        {
            slider?.isUserInteractionEnabled=false
        }

    }
    @objc func slidervalue(_ sender : UISlider)
    {
        lbl?.text = "\(slider!.value)"
        
    }
    @objc func changeclr(_ sender : UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0 {
            lbl!.backgroundColor = UIColor.red
        }
        else if sender.selectedSegmentIndex == 1 {
            lbl!.backgroundColor = UIColor.green
        }
        else {
            lbl!.backgroundColor = UIColor.yellow
        }
        
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

