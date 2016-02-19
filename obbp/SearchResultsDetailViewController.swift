//
//  SearchResultsDetailViewController.swift
//  obbp
//
//  Created by su on 18/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Alamofire
import Locksmith

class SearchResultsDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var bloodGroupLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    
    // Properties
    var user: User? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let fullName = user?.fullName {
            self.fullNameLabel.text = fullName
        }
        
        if let bloodGroup = user?.bloodGroup {
            self.bloodGroupLabel.text = bloodGroup
        }
        
        if let state = user?.state {
            self.stateLabel.text = state
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessagePressed(sender: UIButton) {
        
        performSegueWithIdentifier("segueSendMessage", sender: self)
    }
    
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vm = segue.destinationViewController as! SearchResultMessageViewController
        vm.id = user?.id
    }
    
    
        
}
