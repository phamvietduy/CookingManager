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

class UINavigationControllerBase: UINavigationController,UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self;
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        
        if #available(iOS 9.0, *) {
            if viewController is SFSafariViewController {
                navigationController.setNavigationBarHidden(true, animated: animated)
                return
            }
        } else {
            // Fallback on earlier versions
        }
        
        assert((viewController is ViewControllerBaseProtocol), "controller must inherit from ViewControllerBaseProtocol")
        let vc = viewController as! ViewControllerBaseProtocol
        navigationController .setNavigationBarHidden(!vc.hasNavigationBar, animated: animated)
        if navigationController.viewControllers.count > 1 {
            
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool){
        debugPrint("didShow viewController")
    }
    
    override var shouldAutorotate: Bool{
        return true;
    }
}
