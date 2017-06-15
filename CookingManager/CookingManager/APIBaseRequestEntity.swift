//
//  APIBaseRequestEntity.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/31.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

class ResponseParser<T:APIBaseResponseEntity>{
    var responseObject : T?
    var isSucc : Bool?
    var code : Int?
    var message : String?
    
    init(response : T?, error : Error?) {
        self.responseObject = response
        if(response != nil){
            if(response?.code == nil){
                self.isSucc = true
            }
            else{
                self.code = response?.code
                self.message = response?.message
            }
        }
        else{
            self.code = error?.code
            self.message = error?.localizedDescription
        }
    }
}

class APIBaseRequestEntity: BaseModel {
    var isRequesting : Bool = false
    var requestApi : DataRequest?
    var requestDownload : DataRequest?
    
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
            "Accept":"application/json",
            "Content-Type":"application/json"
        ]
        
        if self.isRequestAuthentication() == true{
            if let authorizationHeader = Request.authorizationHeader(user: Constant.Api.basicAuthenUserName, password: Constant.Api.basicAuthenPasswork) {
                header[authorizationHeader.key] = authorizationHeader.value
            }
        }
        if let appToken = SupportFunctions.userDefault(objectForKey: Constant.UserDefault.appToken) {
            header["X-Pocketshelter-API-Token"] = appToken as? String
        }
        return header
    }
    
    func doRequest<T:APIBaseResponseEntity>(complete: @escaping (_ a:ResponseParser<T>)->Void){
        self.isRequesting = true
        self.requestApi = Alamofire.request(self.url(), method: self.method(), parameters:self.toJSON(), encoding:(self.method() == .get ? URLEncoding.default : JSONEncoding.default), headers:self.header())
        self.requestApi?.responseObject {(response : DataResponse<T>) in
            if response.result.isSuccess == true {
                complete(ResponseParser<T>(response: response.result.value, error: response.error))
            }
            else {
                complete(ResponseParser<T>(response: nil, error: response.error))
            }
            
            self.isRequesting = false
        }
    }
    
    func downloadFile(destinationPath: String, progressBar: UIProgressView? = nil, complete:@escaping ((_ succ: Bool, _ errorCode: String?)->Void)){
        let destination: DownloadRequest.DownloadFileDestination = {_, _ in
            let destinationURL = URL(fileURLWithPath: destinationPath)
            return (destinationURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        Alamofire.download(self.url(), to: destination).downloadProgress{ (progress) in
            progressBar?.progress = Float(progress.fractionCompleted)
        }
        .response {response in
            debugPrint(response)
            if response.error == nil {
                //let filePath = response.destinationURL?.path
                complete(true, nil)
            }
            else{
                complete(false, response.error?.localizedDescription)
            }
        }
    }
}
