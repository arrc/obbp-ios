//
//  SearchResultsViewController.swift
//  obbp
//
//  Created by su on 18/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Alamofire

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var resultsTableView: UITableView!
    
    // Properties
    var users : [User]? = nil
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        print(users!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.users!.count > 0 {
           return self.users!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.resultsTableView.dequeueReusableCellWithIdentifier("searchResults", forIndexPath: indexPath) as! ResultsTableViewCell
        let user = users![indexPath.row]
        cell.fullNameLabel.text = user.fullName
        
        return cell
    }

}
