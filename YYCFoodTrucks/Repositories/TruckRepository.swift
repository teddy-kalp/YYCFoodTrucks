//
//  TruckRepository.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
//import FirebaseStorage

class TruckRespository: ObservableObject{
    @ObservedObject var scheduleRepo = ScheduleRespository()
    @ObservedObject var landmarkRepo = LandMarkRespository()
    @Published var trucks = [Truck]()
    private let db = Firestore.firestore()
    
    init(){
        self.loadData()
    }
    
    func loadData(){
        db.collection("TruckList").order(by: "name").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.trucks = documents.map{(queryDocumentSnapshot) -> Truck in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let id = data["id"] as? Int ?? -1
                let logo = data["logo"] as? String ?? ""
                let category_id = data["categoryId"] as? Int ?? -1
                let menu = data["menu"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                
                
                let truck = Truck(name: name, id: id, logo: logo, category_id: category_id, menu: menu, description: description)
                // Check to see if there is a current schedule
                let currentScheduleLocation = generateTodaySchedule(schedules: self.scheduleRepo.schedules, locations: self.landmarkRepo.landmarks, truck: truck)
                
                if (currentScheduleLocation != ("","", 0, 1)){
                    truck.open = true
                }
                
                return truck
                
            }
        }
    }
    
}
    
