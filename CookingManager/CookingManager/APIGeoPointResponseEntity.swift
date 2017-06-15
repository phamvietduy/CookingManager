//
//  APIGeoPointResponseEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper

class APIGeoPointResponseEntity: APIBaseResponseEntity {
    var positions: [GeoPointModel]?
    var date: String?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        positions <- map["positions"]
        date <- map["date"]
    }
}
