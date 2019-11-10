//
//  EventService.swift
//  Events
//
//  Created by Prince Sojitra on 17/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import Realm

//the service delivers events data
class EventService {
    
    //Get Events data from server side and write on relam dabase for avialble offline.
    func getEvents(callBack:@escaping (Results<EventList>?,_ error:APIError?) -> Void){
        
        
        WebServiceManager.shared.callWebService(WSUrl: Constants.WebServcies.EventList, WSMethod: HttpMethod.Get, WSParams: [:], WSHeader: [:] , isShowLoader: true, LoaderColor: Constants.Colours.PrimaryBlue, WSCompletionBlock: { (response, error) in
            
            guard error == nil else {
                callBack(nil, error)
                return
            }
            
            if let eventListArray = response as? [[String:Any]] {
                
                DispatchQueue.main.async {
                    
                    //Check and clear database before write some sat into it.
                    try! RealmManager.shared.realmObj.write {
                        RealmManager.shared.realmObj.delete(RealmManager.shared.realmObj.objects(EventList.self))
                    }
                    
                    //Wirte Events data into realm databse for offline use
                    for dict in eventListArray {
                        try! RealmManager.shared.realmObj.write {
                            RealmManager.shared.realmObj.add(EventList.fromDictionary(dictionary: dict), update: Realm.UpdatePolicy.modified)
                        }
                    }
                    
                    //Get Events data from realm after succesfull write operation
                    let eventsFromRealm = RealmManager.shared.realmObj.objects(EventList.self)
                    
                    callBack(eventsFromRealm, nil)
                }
            }else {
                callBack(nil, error)
            }
            
        })
        
    }
    
    //Get Events data from realm database and render it to the user if availbe for offline
    func getEventsFromRealm(callBack:@escaping (Results<EventList>?,_ error:APIError?) -> Void){
        
        let eventsFromRealm = RealmManager.shared.realmObj.objects(EventList.self)
        if eventsFromRealm.count > 0 {
            print("Event List",eventsFromRealm)
            callBack(eventsFromRealm, .connectionError)
        }
        else {
            callBack(nil,.notFound)
        }
    }
}
