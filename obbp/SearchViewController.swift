//
//  SearchViewController.swift
//  obbp
//
//  Created by su on 14/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import Alamofire

class SearchViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var bloodGroupTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    
    // Properties
    var users = [User]()
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // blood group
    @IBAction func bloodGroupPicker(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("Blood group", rows: ["A+", "A-", "B+", "B-", "O+", "O-"], initialSelection: 1, doneBlock: {
            picker, value, index in
            self.bloodGroupTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    
    // state
    @IBAction func statePicker(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("State", rows: ["Arizona", "Mumbai", "Pune"], initialSelection: 1, doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            self.stateTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    
    @IBAction func serachPressed(sender: UIButton) {
        let url: String = "http://localhost:3000/search"
        let bloodGroup =  self.bloodGroupTextField.text! as String
        let query = ["bg": bloodGroup]
        
        Alamofire.request(.GET, url, parameters: query).responseJSON { (response) -> Void in
            if let JSON = response.result.value as? NSDictionary {
                let data = JSON["data"]! as! NSArray
                
                for userData in data {
                    var user = User()
                    user.id = userData["_id"] as? String
                    user.fullName = userData["fullName"] as? String
                    user.bloodGroup = userData["bloodGroup"] as? String
                    user.state = userData["state"] as? String
                    self.users.append(user)
                }
                // perform segue
                self.performSegueWithIdentifier("segueFromSearchToSearchResults", sender: self)
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueFromSearchToSearchResults" {
            let vc = segue.destinationViewController as! SearchResultsViewController
            vc.users = self.users
        }
    }
    
    
}
