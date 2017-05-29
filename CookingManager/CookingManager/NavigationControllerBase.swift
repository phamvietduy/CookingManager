//
//  NavigationControllerBase.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import Foundation
import SafariServices
import UIKit

class NavigationControllerBase: UINavigationController,UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        if viewController is SFSafariViewController {
            navigationController.setNavigationBarHidden(true, animated: animated)
            return
        }
        
        assert((viewController is ViewControllerBaseProtocol), "controller must inherit from ViewControllerBaseProtocol")
        let vc = viewController as! ViewControllerBaseProtocol
        navigationController .setNavigationBarHidden(vc.hasNavigationBar, animated: animated)
        if navigationController.viewControllers.count > 1 {
            
        }
    }
    
    override var shouldAutorotate: Bool{
        return true;
    }
}
