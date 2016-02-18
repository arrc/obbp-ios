//
//  SIgnupViewController.swift
//  obbp
//
//  Created by su on 13/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class SIgnupViewController: UITableViewController {
    
    // Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var bloodGroupTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    
    
    // Properties
    var data : [String: AnyObject] = [String: AnyObject]()
    var user : User = User()
    
    // Initial
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Gender control
    @IBAction func genderSelected(sender: UISegmentedControl) {
        print(self.genderControl.selectedSegmentIndex)
    }
    
    // date of birth
    @IBAction func dateOfBirthSelected(sender: UITextField) {
    }
    
    // blood group
    @IBAction func bloodGroupSelected(sender: UITextField) {
    }
    
    // weight
    @IBAction func weightSelected(sender: UITextField) {
    }
    
    // state
    @IBAction func stateSelected(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("State", rows: ["Delhi", "Mumbai", "Pune"], initialSelection: 1, doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            print("picker = \(picker)")
            self.stateTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    // Done
    @IBAction func donePressed(sender: UIBarButtonItem) {
        user.firstName = self.firstNameTextField.text! as String
        print(user)
    }
    
    // Cancel
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    self.data = "this is the default data."
//    self.data["universe"] = self.email
}
