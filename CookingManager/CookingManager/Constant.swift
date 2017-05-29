//
//  Constant.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class Constant: NSObject {
    static let kDataBaseName = "CookingManager.sqlite"
    
    enum TABLE : String {
        case Food
        case Country
    }
    
    struct Path {
        static let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first!
        
        static let dbPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first! + "/" + Constant.kDataBaseName
    }
}
