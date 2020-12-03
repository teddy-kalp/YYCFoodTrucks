//
//  LandMarkRepository.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import CoreLocation

class LocationRepository: ObservableObject{
    private let db = Firestore.firestore()
    @Published var landmarks = [Location]()
    
    init() {
        self.loadData()
    }
    
    func loadData(){
        db.collection("LandMarks").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.landmarks = documents.map{(queryDocumentSnapshot) -> Location in
                let data = queryDocumentSnapshot.data()
                let locationId = queryDocumentSnapshot.documentID
                let address = data["address"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0
                let longitude = data["longitude"] as? Double ?? 0
                
                var location = Location(address: address, latitude: latitude, longitude: longitude)
                location.locationId = locationId
                
                return location
            }
        }
    }
    func findLocationbySchedule(schedule: Schedule) -> Location?{
        for location in self.landmarks{
            if location.locationId == schedule.locationId{
                return location
            }
        }
        return nil
    }
}


