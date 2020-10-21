//
//  LandMarkRepository.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class LandMarkRespository: ObservableObject{
    private let db = Firestore.firestore()
    @Published var landmarks = [LandMark]()
    
    init() {
        loadData()
    }
    
    func loadData(){
        db.collection("LandMarks").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.landmarks = documents.map{(queryDocumentSnapshot) -> LandMark in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let address = data["address"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0
                let longitude = data["longitude"] as? Double ?? 0
                
                return LandMark(name: name, address: address, latitude: latitude, longtitude: longitude)
            }
        }
    }
}
