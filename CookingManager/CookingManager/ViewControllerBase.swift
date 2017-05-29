//
//  ViewControllerBase.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import Foundation

protocol ViewControllerBaseProtocol {
    var hasNavigationBar : Bool {get}
}

class ViewControllerBase: UIViewController, ViewControllerBaseProtocol {
    override var prefersStatusBarHidden: Bool{
        return false;
    }
    
    //MARK: properties from protocol
    var hasNavigationBar: Bool{
        return true;
    }
}

