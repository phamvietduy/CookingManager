//
//  FoodModel.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import Foundation
import ObjectMapper

class FoodModel: BaseModel {
    
    var name : String?
    var from_country : String?
    var cooking_recipe : String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        name <- map["name"]
        from_country <- map["from_country"]
        cooking_recipe <- map["cooking_recipe"]
    }
    
    override func tableName() -> String {
        return Constant.TABLE.Food.rawValue
    }
    
    static func createTable() ->Bool{
        let query = "create table \(Constant.TABLE.Food) (name text, from_country text, cooking_recipe text, unique(name))"
        let databaseManager = DatabaseManager.shareInstance
        if databaseManager.executeQuery(query: query) != true {
            debugPrint("create table fail")
            return false
        }
        return true
    }
    
    static func fetchAll() ->[FoodModel]{
        let databaseManager = DatabaseManager.shareInstance
        let arrayResult = databaseManager.fetchAll(tableName: Constant.TABLE.Food.rawValue)
        if arrayResult.count > 0 {
            return Mapper<FoodModel>().mapArray(JSONArray: arrayResult)!
        }
        return [FoodModel]()
    }
    
    func insertValue()->Bool{
        var arrData = [[String:String]]()
        var obj1 = [String:String]()
        obj1["name"] = "Banh xeo"
        obj1["from_country"] = "Viet Nam"
        obj1["cooking_recipe"] = "Quen mat"
        arrData.append(obj1)
        let databaseManager = DatabaseManager.shareInstance
        if databaseManager.saveValues(arrayData:arrData , tableName: self.tableName()) == true{
            debugPrint("save successfully")
            return true
        }
        return false
    }
}
