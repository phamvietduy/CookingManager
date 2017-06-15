//
//  APICheckVersionRequestEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import Alamofire

class APICheckVersionRequestEntity: APIBaseRequestEntity {
    override func method() -> HTTPMethod {
        return .get
    }
    
    override func url() -> String {
        return Constant.Api.hostName + Constant.Api.CheckVersion
    }
}
