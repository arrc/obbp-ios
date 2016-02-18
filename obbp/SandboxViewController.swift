//
//  SandboxViewController.swift
//  obbp
//
//  Created by su on 18/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import Alamofire

class SandboxViewController: UIViewController {

    @IBOutlet weak var testTestField: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchRequest()
    }
    
    
    @IBAction func testPicker(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("Blood group", rows: ["A+", "A-", "B+", "B-", "O+", "O-"], initialSelection: 0, doneBlock: {
            picker, value, index in

            print("index = \(index)")
            self.testTestField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    @IBAction func searchPressed(sender: UIButton) {
        searchRequest()
    }
    
    @IBAction func donePressed(sender: UIButton) {
        var data = [String: AnyObject]()
        
        data["firstName"] = self.fname.text
        data["lastName"] = self.lname.text
        data["email"] = self.email.text
        data["state"] = self.state.text
        data["bg"] = self.testTestField.text!
        
        if !self.password.text!.isEmpty {
            data["password"] = self.password.text!
        }
        
        

        print(data)
        
        Alamofire.request(.POST, "http://localhost:3000/test", parameters: data, encoding: .JSON).responseJSON { (response) -> Void in
            if let JSON = response.result.value {
                print(JSON)
            }
            
        }
    }
    
    
    func searchRequest() {
        let bloodGroup = self.testTestField.text!
        let url : String = "http://localhost:3000/search"
        var term = [String: String]()
        term["bg"] = bloodGroup
        
        Alamofire.request(.GET, url, parameters: term).responseJSON { (response) -> Void in
            if let JSON = response.result.value {
                print(JSON)
            }
        }
        
    }

}
