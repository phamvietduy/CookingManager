//
//  GeoPointModel.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/06/07.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit
import ObjectMapper

class GeoPointModel: BaseModel {
    var token: String?
    var elevation: String?
    var preparation: String?
    var name: String?
    var des: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var identificationType: String?
    var disasterType: String?
    var isDelete: String?
    var active: String?
    var distance: String?
    
    override func mapping(map: Map) {
        token <- map["token"]
        elevation <- map["elevation"]
        preparation <- map["preparation"]
        name <- map["name"]
        des <- map["description"]
        address <- map["address"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        identificationType <- map["identificationType"]
        isDelete <- map["isDelete"]
        active <- map["active"]
        disasterType <- map["disasterType"]
        distance <- map["distance"]
    }
    
    override class func tableName() -> String {
        return Constant.TABLE.GeoPoint.rawValue
    }
    
    class func createTable(){
        let query = "create table if not exists \(self.tableName()) (id INTEGER PRIMARY KEY, prefecture_id TEXT, token TEXT, elevation TEXT, preparation TEXT, name TEXT, description TEXT, address TEXT, latitude TEXT, longitude TEXT, identificationType TEXT, isDelete TEXT, active TEXT, disasterType TEXT, type TEXT, UNIQUE(token))"
        let dbManager = DatabaseManager()
        dbManager.dbQueue?.inDatabase({ (db: FMDatabase?) in
            do{
                try db?.executeUpdate(query, values: nil)
            }
            catch{
                debugPrint("create table \(self.tableName()) fail : \(error.localizedDescription)")
            }
        })
    }
    
    class func addColumn(columnName:String, type: String){
        let dbManager = DatabaseManager()
        dbManager.dbQueue?.inDatabase({ (db:FMDatabase?) in
            let query = "alter table \(self.tableName()) add column \(columnName) \(type)"
            do{
                try db?.executeUpdate(query, values: nil)
            }
            catch{
                
            }
        })
    }
    
    class func addMultiColumns(arrayColumns:[[String:String]]){
        let dbManager = DatabaseManager();
        dbManager.dbQueue?.inTransaction({ (db:FMDatabase?, rollback: UnsafeMutablePointer<ObjCBool>?) in
            for item in arrayColumns{
                let columnName = item["name"]
                let typeColumn = item["type"]
                let query = "alter table \(self.tableName()) add column \(columnName!) \(typeColumn!)"
                do{
                    try db?.executeUpdate(query, values: nil)
                }
                catch{
                    rollback?.pointee = false
                    debugPrint("alter fail")
                }
            }
        })
    }
    
    class func alterTable(){
//        var version:Int = 3
//        if let i = SupportFunctions.userDefault(objectForKey: Constant.UserDefault.geoTableVersion){
//            version = Int(i as! String)! + 1
//        }
//        self.addColumn(columnName: "column\(version)", type: "TEXT")
        
        var arrayColumn = [[String:String]]()
        arrayColumn.append(["name":"column4", "type":"int"])
        arrayColumn.append(["name":"column5", "type":"text"])
        self.addMultiColumns(arrayColumns: arrayColumn)
    }
    
    class func saveArrayPoint(arrayPoint: [GeoPointModel]?, complete:(_ succes: Bool, _ erorMessage: String?)->Void) {
        if arrayPoint == nil || arrayPoint?.count == 0 {
            complete(true, nil)
            return
        }
        
        let db = DatabaseManager()
        let arrData: [[String:Any]] = arrayPoint!.map { (geoPointModel :GeoPointModel) -> [String:Any] in
            return geoPointModel.toJSON()
        }
        
        if db.saveValues(arrayData: arrData, tableName: self.tableName()) == false{
            complete(false, "save data fail")
            debugPrint("save data fail");
        }
        else{
            complete(true, nil)
        }
    }
    
    class func fetchAllData() -> [GeoPointModel]{
        let dbManager = DatabaseManager()
        let arrData = dbManager.fetchAll(tableName: self.tableName())
        return Mapper<GeoPointModel>().mapArray(JSONArray: arrData)!
    }
}
