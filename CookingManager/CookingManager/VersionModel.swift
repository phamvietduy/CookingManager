//
//  VersionModel.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper

class VersionModel: BaseModel {
    var version: String?
    var url: String?
    var require : [String]?
    
    override func mapping(map: Map) {
        version <- map["version"]
        url <- map["url"]
        require <- map["required"]
    }
}
