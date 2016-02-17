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
            
            print("value = \(value)")
            print("index = \(index)")
            print("picker = \(picker)")
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
            print("picker = \(picker)")
            self.stateTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    
    @IBAction func serachPressed(sender: UIButton) {
        let bloodGroup = self.bloodGroupTextField.text!
        var url: String = "http://localhost:3000/search"
        url += "?bg=\(bloodGroup)"
        print(url)
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            if let JSON = response.result.value {
                print(JSON)
            }
        }
    }
    
    
}
