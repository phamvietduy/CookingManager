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
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCALE                = UIScreen.main.scale
    }
    
    struct Api {
        
        #if SERVER_DEV
            static let hostName = "https://apis-dev.pocketshelter.jp/"
            static let basicAuthenUserName = "pocket"
            static let basicAuthenPasswork = "shelter"
        #elseif SERVER_STAGING
            static let hostName = "https://apis-dev.pocketshelter.jp/"
            static let basicAuthenUserName = "pocket"
            static let basicAuthenPasswork = "shelter"
        #else
            static let hostName = "https://apis-dev.pocketshelter.jp/"
            static let basicAuthenUserName = "pocket"
            static let basicAuthenPasswork = "shelter"
        #endif
        
        static var GetPin = "1/position/"
    }
    
    
}
