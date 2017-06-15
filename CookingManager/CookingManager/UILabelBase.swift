//
//  UILabelBase.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class UILabelBase: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.numberOfLines == 0 && self.preferredMaxLayoutWidth != self.frame.width {
            self.preferredMaxLayoutWidth = self.frame.width
            self.setNeedsUpdateConstraints()
        }
    }
    
    override var intrinsicContentSize: CGSize{
        var s = super.intrinsicContentSize
        if self.numberOfLines == 0 {
            s.height += 1
        }
        return s
    }
    
    class func getFontSizeCorrespondingWithScreen(curSize: CGFloat) -> CGFloat{
        let scale = UIScreen.main.bounds.width/320.0
        return curSize * scale
    }
}
