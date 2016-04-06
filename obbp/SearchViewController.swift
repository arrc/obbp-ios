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
    var performSegue = false
    
    // Objects
    let search = SearchService()
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.stateTextField.text = ""
        self.bloodGroupTextField.text = ""
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
        ActionSheetStringPicker.showPickerWithTitle("State", rows: Utility.sharedInstance.states, initialSelection: 1, doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            self.stateTextField.text = index as? String
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    
    @IBAction func searchPressed(sender: UIButton) {
        // empty array
        self.users.removeAll(keepCapacity: false)
        var query = [String: String]()
        let bloodGroup =  self.bloodGroupTextField.text! as String
        let state = self.stateTextField.text! as String
        
        if state.isEmpty {
            query = ["bg": bloodGroup]
        } else {
            query = ["bg": bloodGroup, "state": state]
        }

        // Perform search
        search.performSearch(query) { (users, error) -> Void in
            guard error == nil else {
                print(error!)
                return
            }
            
            self.users = users!
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                // perform segue
                self.performSegue = true
                self.performSegueWithIdentifier("segueFromSearchToSearchResults", sender: self)
            })
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueFromSearchToSearchResults" {
            let vc = segue.destinationViewController as! SearchResultsViewController
            vc.users = self.users
            
        }
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "segueFromSearchToSearchResults" {
//            let navigationController = segue.destinationViewController as! UINavigationController
//            let controller = navigationController.topViewController as! SearchResultsViewController
//            controller.users = self.users
//        }
//    }
    
}
