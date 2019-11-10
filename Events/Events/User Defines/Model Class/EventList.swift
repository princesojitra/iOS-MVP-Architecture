//
//    EventList.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport


import RealmSwift

enum DutyCode : String {
    case LayOver = "LAYOVER"
    case Flight = "FLIGHT"
    case StandBy = "Standby"
    case Off = "OFF"
}

enum HttpMethod : String {
    case Get = "GET"
    case Post = "POST"
}

enum APIError: Error {
    case unknownError
    case connectionError
    case invalidPostParms
    case notFound
    case invalidResponse
    case unsuppotedURL
}

class EventList: Object {
    
    @objc dynamic var aircraftType: String!
    @objc dynamic var captain: String!
    @objc dynamic var date: String!
    @objc dynamic var departure: String!
    @objc dynamic var destination: String!
    @objc dynamic var dutyCode: String!
    @objc dynamic var dutyID: String!
    @objc dynamic var firstOfficer: String!
    @objc dynamic var flightAttendant: String!
    @objc dynamic var flightnr: String!
    @objc dynamic var tail: String!
    @objc dynamic var timeArrive: String!
    @objc dynamic var timeDepart: String!
    @objc dynamic var id:Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    
    class func fromDictionary(dictionary: [String:Any]) -> EventList    {
        let this = EventList()
        
        //Set autoincrement primary key
        let lastId = RealmManager.shared.realmObj.objects(EventList.self).map({$0.id}).max() ?? 0
        this.id = lastId + 1
        
        if let aircraftTypeValue = dictionary["AircraftType"] as? String{
            this.aircraftType = aircraftTypeValue
        }
        if let captainValue = dictionary["Captain"] as? String{
            this.captain = captainValue
        }
        if let dateValue = dictionary["Date"] as? String{
            this.date = dateValue
        }
        if let departureValue = dictionary["Departure"] as? String{
            this.departure = departureValue
        }
        if let destinationValue = dictionary["Destination"] as? String{
            this.destination = destinationValue
        }
        if let dutyCodeValue = dictionary["DutyCode"] as? String{
            this.dutyCode = dutyCodeValue
        }
        if let dutyIDValue = dictionary["DutyID"] as? String{
            this.dutyID = dutyIDValue
        }
        if let firstOfficerValue = dictionary["FirstOfficer"] as? String{
            this.firstOfficer = firstOfficerValue
        }
        if let flightAttendantValue = dictionary["FlightAttendant"] as? String{
            this.flightAttendant = flightAttendantValue
        }
        if let flightnrValue = dictionary["Flightnr"] as? String{
            this.flightnr = flightnrValue
        }
        if let tailValue = dictionary["Tail"] as? String{
            this.tail = tailValue
        }
        if let timeArriveValue = dictionary["Time_Arrive"] as? String{
            this.timeArrive = timeArriveValue
        }
        if let timeDepartValue = dictionary["Time_Depart"] as? String{
            this.timeDepart = timeDepartValue
        }
        return this
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if aircraftType != nil{
            dictionary["AircraftType"] = aircraftType
        }
        if captain != nil{
            dictionary["Captain"] = captain
        }
        if date != nil{
            dictionary["Date"] = date
        }
        if departure != nil{
            dictionary["Departure"] = departure
        }
        if destination != nil{
            dictionary["Destination"] = destination
        }
        if dutyCode != nil{
            dictionary["DutyCode"] = dutyCode
        }
        if dutyID != nil{
            dictionary["DutyID"] = dutyID
        }
        if firstOfficer != nil{
            dictionary["FirstOfficer"] = firstOfficer
        }
        if flightAttendant != nil{
            dictionary["FlightAttendant"] = flightAttendant
        }
        if flightnr != nil{
            dictionary["Flightnr"] = flightnr
        }
        if tail != nil{
            dictionary["Tail"] = tail
        }
        if timeArrive != nil{
            dictionary["Time_Arrive"] = timeArrive
        }
        if timeDepart != nil{
            dictionary["Time_Depart"] = timeDepart
        }
        return dictionary
    }
    
}


