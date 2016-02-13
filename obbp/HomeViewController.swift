//
//  ViewController.swift
//  obbp
//
//  Created by su on 12/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Locksmith

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let session = Locksmith.loadDataForUserAccount("userSession")
        print(session)
        print(session?["token"] == nil)
        if (session?["token"] == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginView") 
                self.presentViewController(viewController, animated: true, completion: nil)
            })
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressLogoutButton(sender: UIButton) {
        do {
            try Locksmith.deleteDataForUserAccount("userSession")
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginView")
            self.presentViewController(viewController, animated: true, completion: nil)
        } catch {
            print("Error \(error)")
        }
    }

}

