//
//  Favorite.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-28.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Favorite: Identifiable, Codable {
    @DocumentID var id: String?
    var user_id: String
    var truck_id: Int
    var img: String?
    
    init(user_id: String, truck_id: Int, img: String?) {
        self.user_id = user_id
        self.truck_id = truck_id
        self.img = img
    }
}
