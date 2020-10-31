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
    @Published var trucks = [Truck]()
    private let db = Firestore.firestore()
    
    init(){
        self.loadData()
    }
    
    func loadData(){
        db.collection("TruckList").order(by: "name").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.trucks = documents.map{(queryDocumentSnapshot) -> Truck in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let id = data["id"] as? Int ?? -1
                let open = data["open"] as? Bool ?? false
                let logo = data["logo"] as? String ?? ""
                let category_id = data["categoryId"] as? Int ?? -1
                let menu = data["menu"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                
                return Truck(name: name, id: id, open: open, logo: logo, category_id: category_id, menu: menu, description: description)
            }
        }
    }
}
    
