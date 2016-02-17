//
//  SIgnupViewController.swift
//  obbp
//
//  Created by su on 13/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit

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
    }
    
    // Done
    @IBAction func donePressed(sender: UIBarButtonItem) {
        data["firstName"] = self.firstNameTextField.text! as String
        data["lastName"] = self.lastNameTextField.text! as String
        data["username"] = self.usernameTextField.text! as String
        
        guard let email = self.emailTextField.text else {
            print("error no email")
            return
        }
        
        self.data["email"] = email
        
        print(data)
    }
    
    // Cancel
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    self.data = "this is the default data."
//    self.data["universe"] = self.email
}
