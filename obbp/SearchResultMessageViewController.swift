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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        NetworkManager.shared.request(.POST, endpoint: "/api/message", params: payload) { (result, error) -> Void in
            print(result!)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

}
