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
    
    // Properties

    // Init
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let session = Locksmith.loadDataForUserAccount("userSession")
        let user = session!["user"] as! NSDictionary
        usernameLabel.text = user["username"] as? String
        fullNameLabel.text = user["fullName"] as? String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
