//
//  UIFlexibleFontSizeLable.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class UIFlexibleFontSizeLable: UILabelBase {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.updateFontSizeCorrespondingWithScreen()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.updateFontSizeCorrespondingWithScreen()
    }
    
    init(frame: CGRect, font: UIFont){
        super.init(frame: frame)
        self.font = font
        self.updateFontSizeCorrespondingWithScreen()
    }

    //MARK: support functions
    func updateFontSizeCorrespondingWithScreen() {
        let scale = UIScreen.main.bounds.width / 320.0
        let newFontSize = self.font.pointSize * scale
        self.font = UIFont(name: self.font.fontName, size: newFontSize)
    }
    
    
}

