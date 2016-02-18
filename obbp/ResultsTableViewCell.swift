//
//  ResultsTableViewCell.swift
//  obbp
//
//  Created by su on 18/02/16.
//  Copyright © 2016 arrC. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var bloodGroupLabel: UILabel!

    // Properties
    var user: User? = nil

    // Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
