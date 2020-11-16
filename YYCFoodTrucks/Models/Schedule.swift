//
//  Schedule.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-27.
//

import Foundation


class Schedule: Identifiable, Codable {
    
    var locationId: String
    var truckId: String
    var openDate: Date
    var closeDate: Date

    
    init(locationId: String, truckId: String, openDate: Date, closeDate: Date){
        self.locationId = locationId
        self.truckId = truckId
        self.openDate = openDate
        self.closeDate = closeDate
    }
    
    
}

let testSchedules =
    [Schedule(locationId: "testLocation1", truckId: "testTruck1", openDate: Date(), closeDate: Date() + (10*60)),
     Schedule(locationId: "testLocation2", truckId: "testTruck2", openDate: Date(), closeDate: Date() + (60*60))
    ]
