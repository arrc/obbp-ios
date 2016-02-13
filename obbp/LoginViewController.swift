//
//  LoginViewController.swift
//  obbp
//
//  Created by su on 13/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Alamofire
import Locksmith

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Properties
    var token: String?

    // init
    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters = ["username": "admin", "password": "admin"]
        
        
        Alamofire.request(.POST, "http://localhost:3000/login", parameters: parameters).responseJSON { response in
            if let JSON = response.result.value {
                let token = JSON["token"] as! String
                print("TOKEN: \(token)")
                do {
                    try Locksmith.saveData(["token" : token], forUserAccount: "userToken")
                } catch {
                    print("Error \(error)")
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        let dict = Locksmith.loadDataForUserAccount("userToken")!
        let headers = [
            "Authorization": "Bearer \(dict["token"]!)"
        ]
        print(headers)
        Alamofire.request(.GET, "http://localhost:3000/api/profile", headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                print(JSON)
            }
        }
    }

}
