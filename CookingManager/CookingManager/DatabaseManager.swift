//
//  DatabaseManager.swift
//  CookingManager
//
//  Created by Duy Pham Viet on 2017/05/29.
//  Copyright © 2017 Duy Pham Viet. All rights reserved.
//

import UIKit

class DatabaseManager: NSObject {

    static let shareInstance = DatabaseManager()
    var dbQueue : FMDatabaseQueue?
    
    override init() {
        if FileManager.default.fileExists(atPath: Constant.Path.dbPath) != true {
            do{
                try FileManager.default.copyItem(atPath: Bundle.main.path(forResource: Constant.kDataBaseName, ofType: nil)!, toPath: Constant.Path.dbPath)
                debugPrint("copy database to document success")
            }
            catch{
                debugPrint("copy item failed \(error.localizedDescription)")
            }
        }
        
        self.dbQueue = FMDatabaseQueue(path: Constant.Path.dbPath)
    }
    
    func executeQuery(query : String) ->Bool{
        var result = false
        self.dbQueue?.inDatabase({ (db) in
            result = (db?.executeUpdate(query, withVAList: nil))!
        })
        return result
    }
    
    func fetchAll(tableName: String)->[[String: AnyObject]]{
        var result = [[String: AnyObject]]()
        self.dbQueue?.inDatabase({ (db) in
            do {
                let query = "select * from \(tableName)"
                let resultSet = try db?.executeQuery(query, values: nil)
                
                while resultSet?.next() == true {
                    var object = [String: AnyObject]()
                    for index in 0..<Int((resultSet?.columnCount())!) {
                        object[(resultSet?.columnName(for: Int32(index)))!] = resultSet?.object(forColumnIndex: Int32(index)) as AnyObject?
                    }
                    
                    result.append(object)
                }
            }
            catch {
                
            }
        })
        return result
    }
    
    func saveValues(arrayData: [[String:Any]], tableName: String) ->Bool{
        var result = true
        self.dbQueue?.inTransaction({ (db: FMDatabase?, rollBack: UnsafeMutablePointer<ObjCBool>?) in
            do{
                for obj in arrayData {
                    let stringColumn = obj.keys.joined(separator: ",")
                    let stringParameter = obj.keys.map({ (key: String) -> String in
                        return "?"
                    }).joined(separator: ",")
                    
                    let arrayValues : [Any] = obj.values.map({ (value: Any) -> Any in
                        return value
                    })
                
                    try db?.executeUpdate("insert into \(tableName) (\(stringColumn)) values (\(stringParameter))", values: arrayValues)
                }
            }
            catch{
                rollBack?.pointee = true
                result = false
                debugPrint("save data fail")
            }
        })
        return result
    }
    
    func saveValue(dictData: [String:Any], tableName:String) ->Bool{
        var result : Bool = true
        self.dbQueue?.inTransaction({ (db:FMDatabase?, rollback:UnsafeMutablePointer<ObjCBool>?) in
            do{
                let columns = dictData.keys.joined(separator: ",")
                let valuePrameter = dictData.keys.map({ (key: String) -> String in
                    return "?"
                }).joined(separator: ",")
                
                let values : [Any] = dictData.values.map({ (value : Any) -> Any in
                    return value
                })
                
                let query = "insert into \(tableName) (\(columns)) values (\(valuePrameter)"
                try db?.executeUpdate(query, values: values)
            }
            catch{
                rollback?.pointee = true
                result = false
                debugPrint("save data fail : \(error.localizedDescription)")
            }
        })
        return result
    }
    
}
