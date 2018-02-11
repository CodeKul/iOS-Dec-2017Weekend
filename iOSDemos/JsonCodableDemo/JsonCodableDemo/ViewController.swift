//
//  ViewController.swift
//  JsonCodableDemo
//
//  Created by Varun on 11/02/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginButtonPressed (_ sender : UIButton) {
        
        var req = URLRequest(url: URL(string: "https://reqres.in/api/login")!)
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpMethod = "POST"
        
        let loginData = LoginEncodable(email: txtUsername.text!, password: txtPassword.text!)
        
        do {
            req.httpBody = try JSONEncoder().encode(loginData)
        }
        catch {
            print(error)
        }
        
        let dataTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if error == nil {
                do {
                    let result = try JSONDecoder().decode(LoginDecodable.self, from: data!)
                    if result.token != nil {
                        print(result.token!)
                    }
                    else {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Login", message: result.error!, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
                catch {
                    print(error)
                }
            }

        }
        dataTask.resume()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

