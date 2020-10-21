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
        
    }
}
