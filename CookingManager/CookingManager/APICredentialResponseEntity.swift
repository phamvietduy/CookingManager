//
//  APICredentialResponseEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper

class APICredentialResponseEntity: APIBaseResponseEntity {
    var token: String?
    var credential: String?
    var created: String?
    var userId: String?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        token <- map["token"]
        credential <- map["credential"]
        created <- map["created"]
        userId <- map["userId"]
    }
    
}
