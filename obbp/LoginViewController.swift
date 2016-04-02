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
    var credentials: [String: String] = [String: String]()

    // init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        guard let username = self.usernameTextField.text else {
            return
        }
        guard let password = self.passwordTextField.text else {
            return
        }
        
        credentials["username"] = username
        credentials["password"] = password
        
        userService.login(credentials) { () -> Void in // TODO: login error handling
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }
    }

}
