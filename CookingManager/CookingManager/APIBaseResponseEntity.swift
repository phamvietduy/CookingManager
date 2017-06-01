//
//  APIBaseResponseEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/31.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class APIBaseResponseEntity: BaseModel {
    dynamic var result_status = 0
    dynamic var error_code  = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        result_status <- map["result_status"]
        error_code <- map["error_code"]
    }
    
}
