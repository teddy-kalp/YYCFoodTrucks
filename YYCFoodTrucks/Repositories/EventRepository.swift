//
//  EventRepository.swift
//  YYCFoodTrucks
//
//  Created by Bojana on 2020-11-08.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class EventRespository: ObservableObject{
    @ObservedObject var scheduleRepo = EventScheduleRespository()
    @ObservedObject var landmarkRepo = LandMarkRespository()
    @Published var events = [Event]()
    private let db = Firestore.firestore()
    
    
    
    init(){
        self.loadData()
    }
    
    func loadData(){
        db.collection("EventList").order(by: "name").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.events = documents.map{(queryDocumentSnapshot) -> Event in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let id = data["id"] as? Int ?? -1
                let logo = data["logo"] as? String ?? ""
                let eventDate = data["eventDate"] as? String ?? ""
                let eventTime = data["eventTime"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                
                let event = Event(name: name, id: id, logo: logo, eventDate: eventDate, eventTime: eventTime, description: description)
                // Check to see if there is a current schedule
                let currentScheduleLocation = generateTodayEventSchedule(schedules: self.scheduleRepo.schedules, locations: self.landmarkRepo.landmarks, event: event)
                
                if (currentScheduleLocation != ("","")){
                    event.open = true
                }
                
                return event
                
            }
        }
    }
}
    
