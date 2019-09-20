//
//  RealmManager.swift
//  RosterAssignment
//
//  Created by Prince Sojitra on 18/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Realm


class RealmManager : NSObject {
    
    private override init() { }
    
    static let shared:RealmManager  = RealmManager()
    var realmObj :Realm!
    var realmConfig :Realm.Configuration!
    
    //MARK: - Realm Databse Configuration & Intililization
    func setDefaultRealmConfiguration(completion: (() -> Swift.Void)? = nil)
    {
        
        var configObjc = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 3,
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 2) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        
        configObjc.fileURL = configObjc.fileURL!.deletingLastPathComponent().appendingPathComponent(Constants.APPNAME + ".realm")
        
        Realm.Configuration.defaultConfiguration = configObjc
        
        do{
            self.realmObj = try Realm(configuration: configObjc)
            print("Realm Database Path : \(configObjc.fileURL!)")
        }catch{
            print(error.localizedDescription)
        }
        self.realmConfig = configObjc
    }
}
