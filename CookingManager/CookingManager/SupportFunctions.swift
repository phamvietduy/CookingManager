//
//  SupportFunctions.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import Foundation

class SupportFunctions: NSObject {

    class func userDefault(setObject object:Any, forKey key:String){
        UserDefaults.standard.set(object, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func userDefault(removeObjectforKey key:String){
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func userDefault(objectForKey key:String) ->Any?{
        return UserDefaults.standard.object(forKey: key)
    }
    
    class func delay(delay: Double, closure:@escaping ()->()){
        let delayTime = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: closure)
    }
    
    class func hasAppToken() ->Bool{
        return (SupportFunctions.userDefault(objectForKey: Constant.UserDefault.appToken) == nil) ? false : true;
    }
}
