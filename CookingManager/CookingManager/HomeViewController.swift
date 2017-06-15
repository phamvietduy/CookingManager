//
//  ViewController.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class HomeViewController: UIViewControllerBase, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var arrayGeoPoint : [GeoPointModel]?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupTable()
        self.getPoint(complete: { (arrayPoint : [GeoPointModel]) in
            self.arrayGeoPoint = arrayPoint
            self.tableView.reloadData()
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if SupportFunctions.hasAppToken() == false{
            let credentialRequest = APICredentialRequestEntity()
            credentialRequest.os = "ios"
            credentialRequest.version = "10.1"
            credentialRequest.key = "AEwrAbHiHaj4tr8b"
            credentialRequest.doRequest { (complete : ResponseParser<APICredentialResponseEntity>) in
                debugPrint(complete.responseObject as Any)
                
                if complete.isSucc == true && complete.responseObject != nil {
                    SupportFunctions.userDefault(setObject: (complete.responseObject?.token)!, forKey: Constant.UserDefault.userToken)
                    SupportFunctions.userDefault(setObject: (complete.responseObject?.credential)!, forKey: Constant.UserDefault.appToken)
                    
                    self.getGeoPoints()
                }
            }
        }
        else{
            self.getGeoPoints()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTable(){
        tableView.register(UINib.init(nibName: FoodViewCell.className(), bundle: nil), forCellReuseIdentifier: FoodViewCell.className())
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getGeoPoints() {
        let geoPointRequest = APIGeoPointRequestEntity()
        geoPointRequest.position_token = "d076187278d7bc44"
        geoPointRequest.doRequest(complete: { (response : ResponseParser<APIGeoPointResponseEntity>) in
            if(response.isSucc == true)
            {
                debugPrint(response.responseObject as Any)
                GeoPointModel.saveArrayPoint(arrayPoint: response.responseObject?.positions, complete: { (success: Bool, errorCode:String?) in
                    if success == true{
                        self.arrayGeoPoint = GeoPointModel.fetchAllData()
                        self.tableView.reloadData()
                    }
                })
            }
            else{
                debugPrint("error code : \(response.code), description: \(response.message)")
            }
            
        })
    }
    
    
    func getPoint(complete : @escaping(_ arrayPoint : [GeoPointModel]) -> Void){
        DispatchQueue.global().async {
            let arr = GeoPointModel.fetchAllData()
            DispatchQueue.main.async {
                complete(arr)
            }
        }
    }

    //MARK: view controller protocol
    override var hasNavigationBar: Bool{
        return false
    }
    
    //MARK: collectionview protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayGeoPoint?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodViewCell.className(), for: indexPath) as! FoodViewCell
        cell.setGeoPointData(data: (arrayGeoPoint?[indexPath.row])!)
        return cell
    }
}

