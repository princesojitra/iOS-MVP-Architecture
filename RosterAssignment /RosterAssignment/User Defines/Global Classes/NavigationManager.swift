//
//  NavigationManager.swift
//  RosterAssignment
//
//  Created by Prince Sojitra on 18/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//


import Foundation
import UIKit


class NavigationManager : NSObject {
    
    private override init() { }
    
    static let shared:NavigationManager  = NavigationManager()
    
    func setEventListRootViewController() {
        let eventListVC = Constants.MAINSTORYBOARD.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifier.EventListVC) as! EventListVC
        let navObjc = UINavigationController.init(rootViewController: eventListVC)
        Constants.APPDELEGATE.window?.rootViewController = navObjc
    }
}
