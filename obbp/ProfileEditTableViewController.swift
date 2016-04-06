//
//  ProfileEditTableViewController.swift
//  obbp
//
//  Created by su on 04/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ProfileEditTableViewController: UITableViewController {
    
    // Outlets
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    
    // Properties
    var user: User? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.mobileTextField.text = self.user!.mobile as! Int
        self.addressTextField.text = self.user?.address
        self.stateTextField.text = self.user?.state
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // state
    @IBAction func statePicker(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("State", rows: Utility.sharedInstance.states, initialSelection: 1, doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            self.stateTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    @IBAction func changePasswordPressed(sender: UIButton) {
        print("Change password pressed.")
    }
    
    @IBAction func updateProfilePressed(sender: UIButton) {
        var params: [String: AnyObject] = [String: AnyObject]()
        params["address"] = self.addressTextField.text
        params["state"] = self.stateTextField.text
        print(params)
        
    }
}
