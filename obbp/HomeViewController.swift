//
//  ViewController.swift
//  obbp
//
//  Created by su on 12/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit
import Locksmith

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tblView: UITableView!
    
    // Properties
    var camps: [Camp] = [Camp]()
    
    // Objects
    var campService = CampService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!userService.isLoggedIn()){
            return dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginView")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }
        
        campService.fetchCamps { (camps, error) -> Void in
            guard error == nil else { print(error!); return }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.camps = camps!
                self.tblView.reloadData()
            })
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.camps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        var camp: Camp = self.camps[indexPath.row]
        
        cell.textLabel?.text = camp.state
        cell.detailTextLabel?.text = camp.description
        
        
        return cell
    }



}

