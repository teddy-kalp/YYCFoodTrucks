//
//  TruckRepository.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TruckRespository: ObservableObject{
    let db = Firestore.firestore()
    
    @Published var landmarks = [LandMark]()
    
    func loadData(){
        db.collection("Trucks").addSnapshotListener{(querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.landmarks = querySnapshot.documents.compactMap{document in
                    try? document.data(as: LandMark.self)
                }
            }
            else{
                print(error.debugDescription)
            }
        }
        print("Landmarks\n");
        for landmark in landmarks{
            print(landmark.address);
        }
    }
}
