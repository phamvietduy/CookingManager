//
//  ColorExtension.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

extension UIColor {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    class func colorFromHexString(hexString:String) ->UIColor{
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.characters.count != 6 ||
            cString.characters.count != 8) {
            return UIColor.gray
        }
        
        if cString.characters.count == 6{
            cString.append("ff")
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue >> 24) & 0xFF) / 255.0,
            green: CGFloat((rgbValue >> 16) & 0xFF) / 255.0,
            blue: CGFloat((rgbValue >> 8) & 0xFF) / 255.0,
            alpha: CGFloat((rgbValue >> 0) & 0xFF) / 255.0
        )
    }
}
