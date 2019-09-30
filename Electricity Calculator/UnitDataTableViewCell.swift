//
//  UnitDataTableViewCell.swift
//  Electricity Calculator
//
//  Created by Hnin Yi on 9/23/19.
//  Copyright © 2019 Hnin Yi San. All rights reserved.
//

import UIKit

class UnitDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var unitrateLabel: UILabel!
    @IBOutlet weak var unitpriceLabel: UILabel!
    @IBOutlet weak var eachamtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
