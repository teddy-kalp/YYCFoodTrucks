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
<<<<<<< HEAD
    let db = Firestore.firestore()
    
    @Published var landmarks = [LandMark]()
    
    func loadData(){
        db.collection("LandMarks").getDocuments{ (querySnapshot, error) in
            if let e = error{
                print{"There was an issue retrieving data from Firestore.\(e)"}
            }
            else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        print(doc.data())
                    }
                }
            }
            
        }
    }
    
}
=======
    private let db = Firestore.firestore()
    @Published var landmarks = [LandMark]()
    
    init() {
        self.loadData()
    }
    
    func loadData(){
        db.collection("LandMarks").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.landmarks = documents.map{(queryDocumentSnapshot) -> LandMark in
                let data = queryDocumentSnapshot.data()
                
                let address = data["address"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0
                let longitude = data["longitude"] as? Double ?? 0
                let landmarkId = data["locationID"] as? Int ?? 0
                
                //print(openTime < Date() && Date() < closeTime)
                
                return LandMark(address: address, latitude: latitude, longtitude: longitude, landmarkId: landmarkId)
            }
        }
    }
}

>>>>>>> e6abc10205599d158c4af91cecdd71c28f1c1920
