//
//  Schedule.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-27.
//

import Foundation


class Schedule: Identifiable, Codable {
    
    var locationId: Int
    var truckId: Int
    var openDate: Date
    var closeDate: Date
    
    init(locationId: Int, truckId: Int, openDate: Date, closeDate: Date){
        self.locationId = locationId
        self.truckId = truckId
        self.openDate = openDate
        self.closeDate = closeDate
    }
    
}
