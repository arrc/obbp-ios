//
//  RequestViewController.swift
//  obbp
//
//  Created by su on 14/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Alamofire
import ActionSheetPicker_3_0
import Locksmith

class RequestViewController: UITableViewController {
    
    // Outlets
    @IBOutlet weak var bloodGroupTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var hospitalTextField: UITextField!
    @IBOutlet weak var purposeTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    // Properties
    var payload = [String: AnyObject]()
    
    // Initial view load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        if !self.hospitalTextField.text!.isEmpty {
            self.payload["hospital"] = self.hospitalTextField.text!
        }
        
        if !self.purposeTextField.text!.isEmpty {
            self.payload["purpose"] = self.purposeTextField.text!
        }
        
        if !self.messageTextView.text!.isEmpty {
            self.payload["message"] = self.messageTextView.text!
        }
        
        if !self.bloodGroupTextField.text!.isEmpty {
            self.payload["bg"] = self.bloodGroupTextField.text!
        }
        
        if !self.stateTextField.text!.isEmpty {
            self.payload["state"] = self.stateTextField.text!
        }
        
        
        let dict = Locksmith.loadDataForUserAccount("userSession")!
        let headers = [
            "Authorization": "Bearer \(dict["token"]!)"
        ]
        Alamofire.request(.POST, "http://localhost:4000/api/requests", parameters: payload ,headers: headers).responseJSON { response in
            if let _ = response.result.value {
                // clear fields
                self.bloodGroupTextField.text = ""
                self.stateTextField.text = ""
                self.hospitalTextField.text = ""
                self.purposeTextField.text = ""
                self.messageTextView.text = ""
                
                // alert
                let alertController = UIAlertController(title: "Success", message: "Your request has been sent successfully.", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                alertController.addAction(alertAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Sorry", message: "Failed to send request.", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                alertController.addAction(alertAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func bloodGroupPicker(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("Blood group", rows: ["A+", "A-", "B+", "B-", "O+", "O-"], initialSelection: 1, doneBlock: {
            picker, value, index in
            self.bloodGroupTextField.text = index as? String

            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
        
    }
    
    @IBAction func statePicker(sender: AnyObject) {
        self.stateTextField.becomeFirstResponder()
        ActionSheetStringPicker.showPickerWithTitle("State", rows: ["Delhi", "Mumbai", "Pune"], initialSelection: 1, doneBlock: {
            picker, value, index in
            self.stateTextField.text = index as? String
            
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    
}
