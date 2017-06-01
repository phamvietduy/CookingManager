//
//  FoodViewCell.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/30.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class FoodViewCell: TableViewCellBase {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data:FoodModel){
        self.icon.image = UIImage.init(named: "food")
        self.lable.text = data.name! + "\n" + data.from_country! + "\n" + data.cooking_recipe!
    }
}
