//
//  BaseModel.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
    func tableName() -> String{
        preconditionFailure("this method must be overridden")
    }
}
