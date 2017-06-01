//
//  SplashViewController.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class SplashViewController: ViewControllerBase {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.animationSplash()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func animationSplash() {
        UIView.animate(withDuration: 2.0, animations: { 
            self.imageView.alpha = 0.0
        }) { (complete) in
            self.goToHomeScreen()
        }
    }
    
    func goToHomeScreen(){
        let homeVc = storyboard?.instantiateViewController(withIdentifier: HomeViewController.className())
        let arrVC: [UIViewController] = [homeVc!];
        navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    
    //MARK: view controller protocol
    override var hasNavigationBar: Bool{
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
}
