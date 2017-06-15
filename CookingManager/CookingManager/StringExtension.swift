//
//  StringExtension.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import Foundation

extension  String{
    
    func localizedString() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func heigh(constraintWidth: CGFloat, font: UIFont) ->CGFloat{
        let rect = CGSize(width: constraintWidth, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil)
        return boundingBox.height
    }
    
    func isValidEmail()->Bool{
        let stricterFilter = true
        let stricterFilterString = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let laxString = ".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailRegex = (stricterFilter ? stricterFilterString : laxString)
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
}
