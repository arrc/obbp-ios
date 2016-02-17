//
//  SearchViewController.swift
//  obbp
//
//  Created by su on 14/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class SearchViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var locationTextField: UITextField!
    @IBAction func location(sender: UITextField) {
        ActionSheetStringPicker.showPickerWithTitle("Nav Bar From Picker", rows: ["One", "Two", "A lot"], initialSelection: 1, doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            print("picker = \(picker)")
            self.locationTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickerPressed(sender: UIBarButtonItem) {
        ActionSheetStringPicker.showPickerWithTitle("Nav Bar From Picker", rows: ["One", "Two", "A lot"], initialSelection: 1, doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            print("picker = \(picker)")
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)

    }
    
    @IBAction func gender(sender: UISegmentedControl) {
        print(self.genderControl.selectedSegmentIndex)
    }
    
}
