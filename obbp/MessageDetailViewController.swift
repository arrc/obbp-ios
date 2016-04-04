//
//  MessageDetailViewController.swift
//  obbp
//
//  Created by su on 04/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit

protocol MessageDeleteDelegate {
    func didDeleteMessage(index: Int)
}

class MessageDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var messageBodyLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // Properties
    var message: Message? = nil
    var indexPath: Int? = nil
    var delegate: MessageDeleteDelegate? = nil
    var profileController: ProfileViewController = ProfileViewController()
    
    // Objects
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let messageBody = message?.message,
            let sender = message?.sender else {
                print("Message data abscent.")
                return
        }
        
        self.messageBodyLabel.text = messageBody
        self.senderLabel.text = sender
        
//        if let date = message?.date as? String {
//            self.dateLabel.text = date
//        }
        
    }

    @IBAction func deleteButtonPressed(sender: UIBarButtonItem) {
        // TODO: make api delete request
        delegate?.didDeleteMessage(self.indexPath!)
        self.profileController.messages.removeAtIndex(self.indexPath!)
        self.profileController.tblView.reloadData()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}
