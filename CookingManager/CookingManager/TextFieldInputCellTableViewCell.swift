//
//  TextFieldInputCellTableViewCell.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class TextFieldInputCellTableViewCell: UITableViewCellBase {

    @IBOutlet weak var labelTitle: UIFlexibleFontSizeLable!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var viewLineSeparate: UIView!
    @IBOutlet weak var constraintHeightViewLine: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
