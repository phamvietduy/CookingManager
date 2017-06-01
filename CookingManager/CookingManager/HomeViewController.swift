//
//  ViewController.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class HomeViewController: ViewControllerBase, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var arrayFoods : [FoodModel]? = FoodModel.fetchAll();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //FoodModel.createTable()
//        let foodModel = FoodModel(JSON: [String : Any]())
//        foodModel?.insertValue()
        
        tableView.register(UINib.init(nibName: FoodViewCell.className(), bundle: nil), forCellReuseIdentifier: FoodViewCell.className())
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: view controller protocol
    override var hasNavigationBar: Bool{
        return false
    }
    
    //MARK: collectionview protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFoods?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodViewCell.className(), for: indexPath) as! FoodViewCell
        cell.setData(data: (arrayFoods?[indexPath.row])!)
        return cell
    }
}

