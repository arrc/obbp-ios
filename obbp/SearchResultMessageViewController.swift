//
//  SearchResultMessageViewController.swift
//  obbp
//
//  Created by su on 19/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Alamofire
import Locksmith

class SearchResultMessageViewController: UIViewController {

    // Outlets
    @IBOutlet weak var messageTextView: UITextView!
    
    // Properties
    var id : String? = nil
    var payload = [String: AnyObject]()
    
    // Objects
    let search = SearchService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendMessagePressed(sender: UIButton) {
        
        if let id = self.id {
            payload["receiver"] = id
        }
        
        if let message = self.messageTextView.text {
            payload["message"] = message
        }
        
        search.sendMessage(payload) { (result, error) -> Void in // TODO: Error handling
            print(result!)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}
