//
//  ErrorExtension.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/14.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
