//
//  SIgnupViewController.swift
//  obbp
//
//  Created by su on 13/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import Alamofire

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
        let gender = self.genderControl.selectedSegmentIndex
        
        switch gender {
        case 0:
            user.gender = "male"
        case 1:
            user.gender = "female"
        case 2:
            user.gender = "others"
        default:
            print("No gender selected")
        }
    }
    
    // date of birth
    @IBAction func dateOfBirthSelected(sender: UITextField) {
        let datePicker = ActionSheetDatePicker(title: "Date:", datePickerMode: UIDatePickerMode.Date, selectedDate: NSDate(), doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            self.dateOfBirthTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender.superview!.superview)
        let secondsInWeek: NSTimeInterval = 7 * 24 * 60 * 60;
        datePicker.minimumDate = NSDate(timeInterval: -secondsInWeek, sinceDate: NSDate())
        datePicker.maximumDate = NSDate(timeInterval: secondsInWeek, sinceDate: NSDate())
        
        datePicker.showActionSheetPicker()
    }
    
    // blood group
    @IBAction func bloodGroupSelected(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("Blood group", rows: ["A+", "A-", "B+", "B-", "O+", "O-"], initialSelection: 1, doneBlock: {
            picker, value, index in
            self.bloodGroupTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    // weight
    @IBAction func weightSelected(sender: UITextField) {
        var weightArray = [Int]()
        weightArray += 30...250
        ActionSheetStringPicker.showPickerWithTitle("Weight", rows: weightArray, initialSelection: 40, doneBlock: {
            picker, value, index in
            
            self.weightTextField.text = String(weightArray[value])
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    // state
    @IBAction func stateSelected(sender: UITextField) {
        print("State selected")
        self.stateTextField.becomeFirstResponder()
        ActionSheetStringPicker.showPickerWithTitle("State", rows: ["Delhi", "Mumbai", "Pune"], initialSelection: 1, doneBlock: {
            picker, value, index in

            self.stateTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    
    // Done
    @IBAction func donePressed(sender: UIBarButtonItem) {
        user.firstName = self.firstNameTextField.text! as String
        user.lastName = self.lastNameTextField.text! as String
        user.username = self.usernameTextField.text! as String
        user.password = self.passwordTextField.text! as String
        user.email = self.emailTextField.text! as String
        user.dateOfBirth = self.dateOfBirthTextField.text! as String
        user.weight = NSString(string: self.weightTextField.text!).integerValue as Int
        user.address = self.addressTextView.text! as String
        user.pincode = NSString(string: self.pincodeTextField.text!).integerValue as Int
        user.mobile = NSString(string: self.mobileTextField.text!).integerValue as Int
        user.state = self.stateTextField.text! as String
        user.bloodGroup = self.bloodGroupTextField.text! as String

        let params = user.params()
        print(params)
        
        makeSignupRequest(params)

    }
    
    // Cancel
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func makeSignupRequest(params : [String: AnyObject]){
        let url: String = "http://localhost:4000/signup"
        
        
        Alamofire.request(.POST, url, parameters: params).responseJSON { (response) -> Void in
            if let JSON = response.result.value as? NSDictionary {
                print(JSON)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
}
