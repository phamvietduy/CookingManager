//
//  CheckInputData.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/02.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class CheckInputData: NSObject {
    func checkLoginInput(email: String) throws -> Bool{
        guard email.isEmpty == false else {
            throw Constant.ErrorCode.InputIsEmpty
        }
        
        guard email.isValidEmail() == true else {
            throw Constant.ErrorCode.WrongFormat
        }
        
        return true;
    }
}
