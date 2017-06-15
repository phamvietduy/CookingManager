//
//  APICheckVersionResponseEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper

class APICheckVersionResponseEntity: APIBaseResponseEntity {
    var ios: VersionModel?
    var ios_plus: VersionModel?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        ios <- map["ios"]
        ios_plus <- map["ios_plus"]
    }
}
