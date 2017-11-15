//
//  GymTableViewCell.swift
//  pushuptracker17
//
//  Created by Ismayil Hasanov on 11/13/17.
//  Copyright © 2017 GWU. All rights reserved.
//

import UIKit

class GymTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var gymNameLabel: UILabel!
    @IBOutlet weak var gymAddressLabel: UILabel!
    @IBOutlet weak var gymLogoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
