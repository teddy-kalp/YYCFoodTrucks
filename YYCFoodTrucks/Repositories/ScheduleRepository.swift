//
//  ScheduleRepository.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-27.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ScheduleRespository: ObservableObject{
    private let db = Firestore.firestore()
    @Published var schedules = [Schedule]()
    
    init() {
        self.loadData()
    }
    
    func loadData(){
        db.collection("Schedules").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.schedules = documents.map{(queryDocumentSnapshot) -> Schedule in
                let data = queryDocumentSnapshot.data()
                
                
                let openTimestamp = data["openDate"] as? Timestamp ?? nil
                let openDate = openTimestamp!.dateValue()
                let closeTimestamp = data["closeDate"] as? Timestamp ?? nil
                let closeDate = closeTimestamp!.dateValue()
                let locationId = data["locationID"] as? Int ?? -1
                let truckId = data["truckId"] as? Int ?? -1
                
                return Schedule(locationId: locationId, truckId: truckId, openDate: openDate, closeDate: closeDate)
            }
        }
    }
}
