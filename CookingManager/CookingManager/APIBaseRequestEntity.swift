//
//  APIBaseRequestEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/31.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class ResponseParser<T:APIBaseResponseEntity>{
    var responseObject : T?
    var error : Error?
    var isSucc : Bool?
    var isFail : Bool?
    
    init(response : T?, error : Error?, succ : Bool?, fail: Bool?) {
        self.responseObject = response
        self.error = error
        self.isSucc = succ
        self.isFail = fail
    }
}

class APIBaseRequestEntity: Mappable {
    var isRequesting : Bool = false
    var requestApi : DataRequest?
    var requestDownload : DataRequest?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
    func method()->HTTPMethod{
        return HTTPMethod.get
    }
    
    func url() ->String{
        return "must be ovrridden from child class"
    }
    
    func cancelRequest(){
        if requestApi != nil {
            requestApi?.cancel()
        }
    }
    
    func isRequestAuthentication()->Bool{
        return true;
    }
    
    func header()->HTTPHeaders{
        return self.headerAuthentication()
    }
    
    func headerAuthentication()->HTTPHeaders{
        var header : HTTPHeaders = [
            "Accept":"application/json"
        ]
        
        if self.isRequestAuthentication() == true{
            if let authorizationHeader = Request.authorizationHeader(user: Constant.Api.basicAuthenUserName, password: Constant.Api.basicAuthenPasswork) {
                header[authorizationHeader.key] = authorizationHeader.value
            }
        }
        return header
    }
    
    func doRequest<T:APIBaseResponseEntity>(complete: @escaping (_ a:ResponseParser<T>)->Void){
        self.isRequesting = true
        self.requestApi = Alamofire.request(self.url(), method: self.method(), parameters:self.toJSON(), headers:self.header())
        self.requestApi?.responseJSON(completionHandler: { (response :DataResponse<T>) in
            if response.result.isSuccess == true {
                complete(ResponseParser<T>(response: response.result.value, error: response.error, succ: response.result.isSuccess, fail: response.result.isFailure))
            }
            else {
                complete(ResponseParser<T>(response: nil, error: response.error, succ: response.result.isSuccess, fail: response.result.isFailure))
            }
            
            self.isRequesting = false
        })
    }
}
