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
    let db = Firestore.firestore()
    var landmarks = [LandMark]()
    
    init() {
        loadData()
    }
    
    func loadData(){
        db.collection("LandMarks").getDocuments{ (querySnapshot, error) in
            if let e = error{
                print("Error")
                //print{"There was an issue retrieving data from Firestore.\(e)"}
            }
            else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        let name = (data["name"] as? String ?? "Name could not be found")
                        let address = (data["address"] as? String ?? "Address could not be converted")
                        let latitude = (data["latitude"] as? Double ?? 0)
                        let longitude = (data["longitude"] as? Double ?? 0)
                        
                        let landMark = LandMark(name: name, address: address, latitude: latitude, longtitude: longitude)
                        self.landmarks.append(landMark)
                    }
                }
            }
        }
    }
}
