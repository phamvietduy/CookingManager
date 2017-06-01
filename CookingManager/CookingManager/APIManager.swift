//
//  APIManager.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/31.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    static var shareInstance = APIManager()
    
    func request(){
        Alamofire.request("abc").responseJSON { (response : DataResponse<Any>) in
            debugPrint("request \(response.request)")
            debugPrint("response \(response.response)")
            debugPrint("data \(response.data)")
            debugPrint("result \(response.result)")
            debugPrint("result \(response.error)")
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
        Alamofire.request("api", method: HTTPMethod.put, parameters: [String:String]()).responseJSON { (response : DataResponse<Any>) in
            
        }
    }
    
//    func requestApiWithEntity:(APIBase)
}
