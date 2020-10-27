//
//  ScheduleRepository.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-26.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ScheduleRepository: ObservableObject{
    @Published var schedules = [Schedule]()
    private let db = Firestore.firestore()
    
    init(){
        // need to create function to remove previous schedules
        loadData()
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
                let openTime = openTimestamp?.dateValue()
                let closeTimestamp = data["closeDate"] as? Timestamp ?? nil
                let closeTime = closeTimestamp?.dateValue()
                let locationId = data["locationID"] as? Int ?? -1
                let truckId = data["truckId"] as? Int ?? -1
                
               let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "MMM dd,yyyy HH:MM:SS"
                print(dateFormatterPrint.string(from: openTime!))
               print(dateFormatterPrint.string(from: closeTime!))
                
                return Schedule(openDate: openTime!, closeDate: closeTime!, locationId: locationId, truckId: truckId)
            }
        }
    }
    
    
}


