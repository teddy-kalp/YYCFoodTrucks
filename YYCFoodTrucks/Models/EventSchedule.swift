//
//  EventSchedule.swift
//  YYCFoodTrucks
//
//  Created by admin on 2020-11-08.
//

import Foundation
class EventSchedule: Identifiable, Codable {
    
    var locationId: String
    var eventId: Int
    var openDate: Date
    var closeDate: Date

    
    init(locationId: String, eventId: Int, openDate: Date, closeDate: Date){
        self.locationId = locationId
        self.eventId = eventId
        self.openDate = openDate
        self.closeDate = closeDate
    }
    
    
}
