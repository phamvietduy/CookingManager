//
//  BaseModel.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel: NSObject, Mappable {
    override init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
    class func tableName() -> String{
        preconditionFailure("this method must be overridden")
    }
}
