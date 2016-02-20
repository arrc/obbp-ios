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
    var selectedRow: User? = nil

    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.resultsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let user = self.users {
           return user.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.resultsTableView.dequeueReusableCellWithIdentifier("searchResults", forIndexPath: indexPath) as! ResultsTableViewCell
        let user = self.users![indexPath.row]
        cell.fullNameLabel.text = user.fullName
        cell.bloodGroupLabel.text = user.bloodGroup
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedRow = self.users![indexPath.row]
        self.resultsTableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("segueFromSearchResultsToDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueFromSearchResultsToDetail" {
            let vc = segue.destinationViewController as! SearchResultsDetailViewController
            vc.user = self.selectedRow
        }
        
    }
    
    

}
