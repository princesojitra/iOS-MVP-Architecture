//
//  Constants.swift
//  RosterAssignment
//
//  Created by Prince Sojitra on 16/9/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Realm

class Constants {
    
    //MARK: - GENERAL CONSTANT
    static let APPNAME = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
    static let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate
    static var MAINSTORYBOARD =  UIStoryboard(name: "Main", bundle: nil)
    static var BaseUrl = "https://get.rosterbuster.com/"
}


//MARK: - StoryBoards & Identifiers
extension Constants {
    
    struct StoryBoardIdentifier {
        static let EventList = "EventList"
        static let EventDetails = "EventDetails"
    }
    
    struct ViewControllerIdentifier {
        static let EventListVC =  "EventListVC"
        static let EventDetails = "EventDetailsVC"
    }
}


//MARK: - Colours
extension Constants {
    struct Colours {
        static let Clear = UIColor.clear
        static let Black = UIColor.black
        static let White = UIColor.white
        static let PrimaryRed = UIColor.clear.HexStringToUIColor(hex: "#B43027")
        static let PrimaryBlue = UIColor.clear.HexStringToUIColor(hex: "#14466E")
        static let PrimaryGrey = UIColor.clear.HexStringToUIColor(hex:"#A0A0A0")
        static let GrediantRed = UIColor.clear.HexStringToUIColor(hex:"#78503B")
        static let GrediantGrey = UIColor.clear.HexStringToUIColor(hex:"#555555")
    }
}

//MARK: - Assets
extension Constants {
    
    struct Assets {
        static let Back = "back"
    }
}

//MARK: - Strings & Messages
extension Constants {
    
    struct Strings {
        static let strOk = "OK"
        static let strEmptyList = "There are no flights available."
        static let strEventListNavTitle = "Events"
        static let strEventDetailsNavTitle = "Event Details"
    }
    
    struct Messages {
        static let NoInternet = "The internet connection appears to be offline"
        static let Error = "Something went wrong."
        
    }
    
    struct DateFormatter {
        static let EventGetDate =  "dd/MM/yyyy"
        static let EventPrintDate = "dd MMM, yyyy"
    }
}

//MARK: - TableViewCell Identifiers
extension Constants {
    struct TblCellIdentifier {
        static let EventList = "TblCell_EventList"
        static let EventListHeader = "TblCell_EventListHeader"
        
    }
}

//MARK: - Webservcies
extension Constants {
    
    struct WebServcies {
        static let EventList =  BaseUrl + "wp-content/uploads/dummy-response.json"
    }
}
