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
}
