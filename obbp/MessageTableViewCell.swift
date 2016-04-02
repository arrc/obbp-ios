//
//  MessageTableViewCell.swift
//  obbp
//
//  Created by su on 02/04/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // Properties

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
