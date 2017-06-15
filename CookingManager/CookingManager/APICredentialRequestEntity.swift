//
//  APICredentialResponseEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class APICredentialRequestEntity: APIBaseRequestEntity {
    var os:String?
    var version:String?
    var key:String?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        os <- map["os"]
        version <- map["version"]
        key <- map["key"]
    }
    
    override func url() -> String {
        return Constant.Api.hostName + Constant.Api.GetCredential
    }
    
    override func method() -> HTTPMethod {
        return HTTPMethod.post
    }
}
