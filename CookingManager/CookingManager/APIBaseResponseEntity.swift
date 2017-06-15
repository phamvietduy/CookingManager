//
//  APIBaseResponseEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/31.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper

class APIBaseResponseEntity: BaseModel {
    var message: String?
    var code: Int?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        code <- map["code"]
        message <- map["message"]
    }
    
}
