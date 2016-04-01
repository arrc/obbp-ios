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
        print(self.messageTextView.text)
        let dict = Locksmith.loadDataForUserAccount("userSession")!
        let headers = [
            "Authorization": "Bearer \(dict["token"]!)"
        ]
        
        if let id = self.id {
            payload["receiver"] = id
        }
        
        if let message = self.messageTextView.text {
            payload["message"] = message
        }
        
        Alamofire.request(.POST, "http://localhost:4000/api/message", parameters: payload ,headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                print(JSON)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        
    }

}
