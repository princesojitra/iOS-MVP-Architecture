//
//  DateFormatManager.swift
//  Events
//
//  Created by Prince Sojitra on 18/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//

import Foundation
import UIKit

class DateFormatManager : NSObject {
    
    private override init() { }
    
    static let shared:DateFormatManager  = DateFormatManager()
    
    //Set travel date format (i.e "dd/MM/yyyy" in our case) to get the actual date object
    func getDateFormat(stringFormat:String) -> DateFormatter {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = stringFormat
        return  dateFormatterGet
    }
    
    //Set travel date format based on print requirement (i.e "dd MMM, yyyy" in our case) to get the actual date object
    func printDateFormat(stringFormat:String) -> DateFormatter {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = stringFormat
        return  dateFormatterPrint
    }
    
    //Get the travel date from server side, format it based on requirement and then print it based on our desired format. (i.e "17/07/2018" to 17 Jul, 2018 in our case)
    func dateStringPrintable(strDate:String,getFormat:String,printFormat:String) -> String {
        
        //Set date format to "dd/MM/yyyy" to get the actual date object
        let getDateFormatter = DateFormatManager.shared.getDateFormat(stringFormat: getFormat)
        
        //Set date format to "dd MMM, yyyy" to get the printable date object
        let printDateFormatter = DateFormatManager.shared.printDateFormat(stringFormat:printFormat)
        
        //Get date in desired format and print it
        if let getDateFromSting = getDateFormatter.date(from: strDate) {
            return printDateFormatter.string(from: getDateFromSting)
        } else {
            print("There was an error decoding the string")
            return strDate
        }
    }
    
    //Get the hours, minutes and seconds from departure and arrival time and callculate the time difference for travel (i.e either "23:00:00" or "13:45" format based on respose we got)
    func getTimeDifferenceFromString(startDate : String, endDate: String) -> (Int, Int, Int, Int) {
        
        //Divide time string by seperating it with ":"
        let sourceDateArray = startDate.components(separatedBy: ":")
        let destinationDateArray = endDate.components(separatedBy: ":")
        
        //Get source and destination date object for date and time comparision
        var  sourceDate = Date()
        var  destinationDate = Date()
        
        //Check source date will have all 3 time components or not (i.e "23:34:25" --> "HH:mm:ss")
        switch  sourceDateArray.count {
        //Source date will have only hours time component
        case 1:
            sourceDate = self.dateByAdding(hours: Int(sourceDateArray.first ?? "00") ?? 0, minutes: 0, seconds: 0)
            break
        //Source date will have hours & minutes time component
        case 2:
            sourceDate = self.dateByAdding(hours: Int(sourceDateArray.first ?? "00") ?? 0, minutes: Int(sourceDateArray[1]) ?? 0, seconds: 0)
            break
        //Source date will have hours, minutes & seconds time component
        case 3:
            sourceDate = self.dateByAdding(hours: Int(sourceDateArray.first ?? "00") ?? 0, minutes: Int(sourceDateArray[1]) ?? 0, seconds: Int(sourceDateArray.last ?? "00") ?? 0)
            break
        default:
            break
        }
        
        //Check destination date will have all 3 time components or not (i.e "23:34:25" --> "HH:mm:ss")
        switch  destinationDateArray.count {
        //destination date will have only hours time component
        case 1:
            destinationDate = self.dateByAdding(hours: Int(destinationDateArray.first ?? "00") ?? 0, minutes: 0, seconds: 0)
            break
        //destination date will have hours & minutes time component
        case 2:
            destinationDate = self.dateByAdding(hours: Int(destinationDateArray.first ?? "00") ?? 0, minutes: Int(destinationDateArray[1]) ?? 0, seconds: 0)
            break
        //destination date will have hours, minutes & seconds time component
        case 3:
            destinationDate = self.dateByAdding(hours: Int(destinationDateArray.first ?? "00") ?? 0, minutes: Int(destinationDateArray[1]) ?? 0, seconds: Int(destinationDateArray.last ?? "00") ?? 0)
            break
        default:
            break
        }
        
        //Get the time difference between departure and arrival time
        let timeDifference :(Int,Int,Int,Int) = self.getTimeDifferenceFromDate(startDate: sourceDate, endDatte: destinationDate)
        
        return timeDifference
        
    }
    
    //Add hours, minute and secods in current date which is used to get the time difference between departure and arrival time by comraing departure and arrival time.
    func dateByAdding(hours:Int,minutes:Int,seconds:Int) -> Date {
        
        let hoursToAdd = hours
        let minsToAdd = minutes
        let secToAdd = seconds
        let currentDate = Date()
        
        var iDateComponent = DateComponents()
        iDateComponent.hour = hoursToAdd
        iDateComponent.minute = minsToAdd
        iDateComponent.second = secToAdd
        
        let futureDate = Calendar.current.date(byAdding: iDateComponent, to: currentDate)
        
        return futureDate!
    }
    
    //Calculate the time differnece between two date and returns in days, hours, minutes and seconds format.
    func getTimeDifferenceFromDate(startDate:Date, endDatte : Date) -> (Int, Int, Int, Int){
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: startDate , to: endDatte );
        let seconds = difference.second ?? 0
        let minutes = difference.minute ?? 0
        let hours = difference.hour ?? 0
        let days = difference.day ?? 0
        
        return (days,hours,minutes,seconds)
    }
    
}
