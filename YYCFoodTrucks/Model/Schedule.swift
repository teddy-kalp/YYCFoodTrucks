//
//  Schedule.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-26.
//

import Foundation

class Schedule: Identifiable, Codable{
    var openDate: Date
    var closeDate: Date
    var locationId: Int
    var truckId: Int
    
    init(openDate: Date, closeDate: Date, locationId: Int, truckId: Int) {
        self.openDate = openDate
        self.closeDate = closeDate
        self.locationId = locationId
        self.truckId = truckId
    }
}
