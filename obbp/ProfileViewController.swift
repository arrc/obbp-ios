//
//  ProfileViewController.swift
//  obbp
//
//  Created by su on 14/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MessageDeleteDelegate {
    
    // Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bloodGroupAndLocationLabel: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    // Properties
    var messages: [Message] = [Message]()
    var selectedMessage: Message? = nil
    var selectedIndexPath: Int? = nil
    var user: User? = nil
    
    // Objects
    let profileService = ProfileService()
    let messageService = MessageService()

    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        let sessionData = Session.sharedInstance.getSessionData()
        self.user = sessionData!.user
        
        let bloodGroupAndLocationDetail: String = "\(self.user!.bloodGroup!), \(self.user!.state!)"
        
        usernameLabel.text = self.user?.username
        fullNameLabel.text = self.user?.fullName
        bloodGroupAndLocationLabel.text = bloodGroupAndLocationDetail
        profileImageView.image = UIImage(named: "user.jpg")
        
        messageService.fetchMessages { (messages, error) -> Void in
            guard error == nil else { print(error!); return }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.messages = messages!
                self.tblView.reloadData()
            })
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tblView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didDeleteMessage(index: Int) { // TODO:- NOT GETTING CALLED
        print("INDEX: \t", index)
        self.messages.removeAtIndex(index)
        self.tblView.reloadData()
    }
    
    @IBAction func didPressLogoutButton(sender: UIButton) {
        userService.logout { (result) -> Void in
            if (!result) {
                return print("Failed to logout!")
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginView")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }

    }
    
    // MARK:- table view
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MessageTableViewCell
        let message = self.messages[indexPath.row]
        
        cell.messageLabel.text = message.message
        cell.senderLabel.text = message.sender
//        cell.dateLabel.text = message.date
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedMessage = self.messages[indexPath.row]
        self.selectedIndexPath = indexPath.row
        self.tblView.deselectRowAtIndexPath(indexPath, animated: false)
        performSegueWithIdentifier("fromProfileViewToMessageDetailView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fromProfileViewToMessageDetailView" {
            let vc = segue.destinationViewController as? MessageDetailViewController
            vc?.indexPath = self.selectedIndexPath!
            vc?.message = self.selectedMessage!
            vc?.profileController = self
        }
        
        if segue.identifier == "fromProfileViewToProfileEditView" {
            let vc = segue.destinationViewController as? ProfileEditTableViewController
            vc?.user = self.user
        }
    }
    
}
