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
<<<<<<< HEAD
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
=======
    @Published var trucks = [Truck]()
    private let db = Firestore.firestore()
    
    init(){
        self.loadData()
    }
    
    func loadData(){
        db.collection("TruckList").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.trucks = documents.map{(queryDocumentSnapshot) -> Truck in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let id = data["id"] as? Int ?? -1
                let open = data["open"] as? Bool ?? false
                let img = data["imgUrl"] as? String ?? ""
                let category_id = data["categoryId"] as? Int ?? -1
                let menu = data["menu"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                
                
                return Truck(name: name, id: id, open: open, img: img, category_id: category_id, menu: menu, description: description)
            }
        }
    }
}
    
>>>>>>> e6abc10205599d158c4af91cecdd71c28f1c1920
