//
//  ProfileViewController.swift
//  obbp
//
//  Created by su on 14/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Locksmith

class ProfileViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bloodGroupAndLocationLabel: UILabel!
    
    // Properties

    // Init
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let session = Locksmith.loadDataForUserAccount("userSession")
        let user = session!["user"] as! NSDictionary
        
        let bloodGroupAndLocationDetail: String = "\(user["bloodGroup"]!), \(user["state"]!)"
        
        usernameLabel.text = user["username"] as? String
        fullNameLabel.text = user["fullName"] as? String
        bloodGroupAndLocationLabel.text = bloodGroupAndLocationDetail
        profileImageView.image = UIImage(named: "user.jpg")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogoutButton(sender: UIButton) {
        userService.logout { (result) -> Void in
            if (!result) {
                return print("Failed to logout!")
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginView")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }

    }
    
}
