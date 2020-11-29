//
//  Global.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-29.
//  (@Teddy: added events, Bojana 11/8/2020)
//

import Foundation
import SwiftUI
import CoreLocation

// used for the primary colors of our applications
let primColor = Color(red: 0, green: 0.73, blue: 0.6, opacity: 1)
let primColorUI = UIColor(red: 0, green: 0.73, blue: 0.6, alpha: 1)

// variables used for fillers if an object is not found
var fillerTruck = Truck(name: "fillerTruck", id: "XXXX",logo: "null", category_id: -1, menu: "null", description: "null")
var fillerLocation = Location(address: "null", latitude: 0, longitude: 0)

//variables for fillers if an event object is not found
var fillerEvent = Event(name: "fillerEvent", id: -2, logo: "null", eventDate: "null", eventTime: "null", description: "null", location: "null")

// all data repositories



// need to generate upcoming schedules
func generateUpcomingSchedule(schedules: [Schedule], locations: [Location], truck: Truck) -> [String]{
    var scheduleLocations = [String] ()
    
    let hoursMinutes = DateFormatter()
    hoursMinutes.dateFormat = "HH:MM a"
    
    let monthDayYear = DateFormatter()
    monthDayYear.dateFormat = "MMM dd yyyy"
    
    for schedule in schedules{
        if (schedule.openDate > Date() && schedule.truckId == truck.id){
            let openTime = hoursMinutes.string(from: schedule.openDate)
            let openDate = monthDayYear.string(from: schedule.openDate)
            let closeTime = hoursMinutes.string(from: schedule.closeDate)
            
            let sched = "\(openDate) from \(openTime) - \(closeTime)"
            
            for location in locations{
                if (schedule.locationId == location.locationId){
                    scheduleLocations.append("\(location.address)\n\(sched)")
                }
            }
            
        }
    }

    
    return scheduleLocations
}

//generate upcoming event schedule

func generateUpcomingEventSchedule(schedules: [EventSchedule], locations: [Location], event: Event) -> [String]{
    var scheduleLocations = [String] ()
    
    let hoursMinutes = DateFormatter()
    hoursMinutes.dateFormat = "HH:MM a"
    
    let monthDayYear = DateFormatter()
    monthDayYear.dateFormat = "MMM dd yyyy"
    
    for schedule in schedules{
        if (schedule.openDate > Date() && schedule.eventId == event.id){
            let openTime = hoursMinutes.string(from: schedule.openDate)
            let openDate = monthDayYear.string(from: schedule.openDate)
            let closeTime = hoursMinutes.string(from: schedule.closeDate)
            
            let sched = "\(openDate) from \(openTime) - \(closeTime)"
            
            for location in locations{
                if (schedule.locationId == location.locationId){
                    scheduleLocations.append("\(location.address)\n\(sched)")
                }
            }
            
        }
       
    }
    return scheduleLocations
}


func generateTodaySchedule(schedules: [Schedule], locations: [Location], truck: Truck) -> (String, String, Double, Double){
    var AddressToReturn = ""
    var TimeToReturn = ""
    var latitude: Double = 0
    var longitude: Double = 1
    
    let hoursMinutes = DateFormatter()
    hoursMinutes.dateFormat = "HH:MM a"
    
    for schedule in schedules{
        if (schedule.openDate < Date() && Date() < schedule.closeDate && schedule.truckId == truck.id){
            let openTime = hoursMinutes.string(from: schedule.openDate)
            let closeTime = hoursMinutes.string(from: schedule.closeDate)
            TimeToReturn = "Today \(openTime) - \(closeTime)"
            for location in locations{
                if (schedule.locationId == location.locationId){
                    AddressToReturn = location.address
                    latitude = location.latitude
                    longitude = location.longitude
                    return(TimeToReturn, AddressToReturn, latitude, longitude)
                }
            }
        }
        
    }
    return(TimeToReturn, AddressToReturn, latitude, longitude)
}

//generate the events for today

func generateTodayEventSchedule(schedules: [EventSchedule], locations: [Location], event: Event) -> (String, String){
    var AddressToReturn = ""
    var TimeToReturn = ""
    
    let hoursMinutes = DateFormatter()
    hoursMinutes.dateFormat = "HH:MM a"
    
    for schedule in schedules{
        if (schedule.openDate < Date() && Date() < schedule.closeDate && schedule.eventId == event.id){
            let openTime = hoursMinutes.string(from: schedule.openDate)
            let closeTime = hoursMinutes.string(from: schedule.closeDate)
            TimeToReturn = "Today \(openTime) - \(closeTime)"
            for location in locations{
                if (schedule.locationId == location.locationId){
                    AddressToReturn = location.address
                    return(TimeToReturn, AddressToReturn)
                }
            }
        }
        
    }
    return (TimeToReturn, AddressToReturn)
}
