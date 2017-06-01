//
//  TableViewCellBase.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/30.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class TableViewCellBase: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func className()-> String{
        return "\(self)"
    }
    
}
