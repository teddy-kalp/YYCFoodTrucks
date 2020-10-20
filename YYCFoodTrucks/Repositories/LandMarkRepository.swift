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
