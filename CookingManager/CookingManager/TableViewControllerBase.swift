//
//  TableViewControllerBase.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import Foundation

class TableViewController : UITableViewController, ViewControllerBaseProtocol{
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    
    //MARK: 
    var hasNavigationBar: Bool{
        return true
    }
}
