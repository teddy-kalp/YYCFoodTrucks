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
        updateOldSchedules()
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
                let openDate = openTimestamp!.dateValue()
                let closeTimestamp = data["closeDate"] as? Timestamp ?? nil
                let closeDate = closeTimestamp!.dateValue()
                let locationId = data["locationId"] as? String ?? ""
                let truckId = data["truckId"] as? String ?? ""
                let deleted = data["deleted"] as? Bool ?? true

                return Schedule(locationId: locationId, truckId: truckId, openDate: openDate, closeDate: closeDate)
            }
        }
    }
    
    func updateOldSchedules(){
        var idsToRemove = [String]()
        db.collection("Schedules").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            for doc in documents{
                let data = doc.data()
                let id = doc.documentID
                let closeTimestamp = data["closeDate"] as? Timestamp ?? nil
                let closeDate = closeTimestamp!.dateValue()
                if (closeDate < Date()){
                    idsToRemove.append(id)
                }
            }
            
            for id in idsToRemove{
                self.db.collection("Schedules").document(id).updateData(["deleted": true])
            }
        }
    }
}
