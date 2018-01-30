//
//  AppDelegate.swift
//  SQLiteDemo
//
//  Created by Varun on 30/01/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import SQLite3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var db: OpaquePointer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        createDB()
        return true
    }
    
    func createDB() {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("student.sqlite")
        
        // open database
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        if sqlite3_exec(db, "create table if not exists Student (roll_no text, name text, marks text)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        else {
            print("table created!")
        }
    }
    
    func executeQuery(_ str:String) -> Bool
    {
        var result:Bool=false
        var stmt:OpaquePointer? = nil
        let strExec=str.cString(using: String.Encoding.utf8)
        
        if (sqlite3_prepare_v2(db, strExec! , -1, &stmt, nil) == SQLITE_OK)
        {
            if (sqlite3_step(stmt) == SQLITE_DONE)
            {
                result=true
            }
        }
        else {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error while inserting: \(errmsg)")
        }
        sqlite3_finalize(stmt)
        return result
    }
    
    func selectQuery(_ str:String) -> Array<Dictionary<String,String>>
    {
        var result:Array<Dictionary<String,String>>=[]
        var stmt:OpaquePointer? = nil
        
        let strExec = str.cString(using: String.Encoding.utf8)
        
        if (sqlite3_prepare_v2(db, strExec! , -1, &stmt, nil) == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW)
            {
                var i:Int32=0
                let icount:Int32=sqlite3_column_count(stmt)
                
                var dict=Dictionary<String, String>()
                
                while i < icount
                {
                    let strF = sqlite3_column_name(stmt, i)
                    let strV = sqlite3_column_text(stmt, i)
                    
                    let rFiled:String=String(cString: strF!)
                    let rValue:String=String(cString: strV!)
                    //let rValue=String(cString: UnsafePointer<Int8>(strV!))
                    
                    dict[rFiled] = rValue
                    i += 1
                }
                result.insert(dict, at: result.count)
            }
            sqlite3_finalize(stmt)
        }
        return result
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

