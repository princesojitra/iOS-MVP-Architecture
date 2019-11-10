//
//  EventDetailsPresenter.swift
//  Events
//
//  Created by Prince Sojitra on 18/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//


import UIKit
import Foundation

//Coordinate with view & model as well update them respectivily based on user action.
class EventDetailsPresenter {
    
    //Event details arry
    var eventDetails = [String:EventList]()
    
    //Initiliaze details arry from source vc
    init(eventDetails: [String:EventList]) {
        self.eventDetails = eventDetails
    }
    
    //Get total travel time by diffrinciate departure and arrival time
    func getTravelTime() -> String {
        
        let timeDiffernece = DateFormatManager.shared.getTimeDifferenceFromString(startDate: self.eventDetails.first?.value.timeDepart ??  "" , endDate: self.eventDetails.first?.value.timeArrive ?? "")
        
        let hours = timeDiffernece.1 < 9 ? "0" + String(timeDiffernece.1) : String(timeDiffernece.1)
        let minutes = timeDiffernece.2 < 9 ? "0" + String(timeDiffernece.2) : String(timeDiffernece.2)
        let strTravelDate = "(" + hours + ":" + minutes + " hours)"
        return strTravelDate
    }
    
    //Get departure time
    func getDepartureTime() -> String {
        return self.eventDetails.first?.value.timeDepart ?? ""
    }
    
    //Get arrival time
    func getArrivalTime() -> String {
        return self.eventDetails.first?.value.timeArrive ?? ""
    }
    
    //Get captain
    func getCaptain() -> String {
        return self.eventDetails.first?.value.captain ?? ""
    }
    
    //Get first officer
    func getFirstOfficer() -> String {
        return self.eventDetails.first?.value.firstOfficer ?? ""
    }
    
    //Get flight number
    func getFlightNumber() -> String {
        return self.eventDetails.first?.value.flightnr ?? ""
    }
    
    //Get aircraft type
    func getAircrafType() -> String {
        return self.eventDetails.first?.value.aircraftType ?? ""
    }
    
    //Get departure
    func getDeparture() -> String {
        return self.eventDetails.first?.value.departure ?? ""
    }
    
    //Get arrival
    func getArrival() -> String {
        return self.eventDetails.first?.value.destination ?? ""
    }
    
    //Get travel date
    func getTravelDate() -> String {
        
        let strTravelDate = DateFormatManager.shared.dateStringPrintable(strDate: self.eventDetails.keys.first!, getFormat: Constants.DateFormatter.EventGetDate, printFormat: Constants.DateFormatter.EventPrintDate)
        return strTravelDate
    }
    
    //Get image arrow
    func getRightArrowImg() -> UIImage {
        return UIImage.fontAwesomeIcon(name: .longArrowAltRight, style: .solid, textColor: UIColor.white, size: CGSize(width: 70.0, height: 45.0))
    }
}
