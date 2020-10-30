//
//  FavoriteRepository.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-27.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FavoriteRespository: ObservableObject{
    private let db = Firestore.firestore()
    @Published var favorites = [Favorite]()
    
    init() {
        self.loadData()
    }
    
    func loadData(){
        let userId = String(Auth.auth().currentUser!.uid)
        
        db.collection("Favorites").whereField("user_id", isEqualTo: userId).addSnapshotListener{ (favoriteList, error) in
            guard let documents = favoriteList?.documents else{
                   print("No Documents")
                   return
               }
               print("Documents", documents)
               self.favorites = documents.map{(queryDocumentSnapshot) -> Favorite in
                   let data = queryDocumentSnapshot.data()
                   let id = queryDocumentSnapshot.documentID
                   let user_id = data["user_id"] as? String ?? ""
                   let truck_id = data["truck_id"] as? Int ?? -1
                   let img = data["img"] as? String ?? ""
                   let fav = Favorite(user_id: user_id, truck_id: truck_id, img: img)
                   fav.id = id
                return fav
               }
         print("Got favorites list", self.favorites)
        }
       
    }
    
    
    func addFavorite(truck_id: Int){
        do{
            let userId = String(Auth.auth().currentUser!.uid)
            let addedFavorite = Favorite(user_id: userId, truck_id: truck_id, img: "")
            let _ = try db.collection("Favorites").addDocument(from: addedFavorite)
        } catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func removeFavorite(truck_id: Int){
        let doc_id = self.getDocID(truck_id: truck_id)
        if let doc_id = doc_id {
            do{
                try db.collection("Favorites").document(doc_id).delete()
            } catch{
                fatalError("Unable to encode task \(error.localizedDescription)")
            }
        }
    }
    
    func getDocID(truck_id: Int) -> String?{
        for favorite in self.favorites{
              if favorite.truck_id == truck_id{
                print("Found Document ID")
                return favorite.id
              }
          }
          return nil
    }
    
    func checkTruckID(truck_id: Int) -> Bool{
        for favorite in self.favorites{
            if favorite.truck_id == truck_id{
                return true
            }
        }
        return false
    }
    
}
