//
//  Truck.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import Foundation
import FirebaseFirestore

class Truck: Identifiable, Codable {
    var operatorID: Int
    var name: String
    
    // these variables will be used with the LandMark Repo to see if we have stored these somewhere //
    var address: String
    var addressName: String
    
    // open and close times used to determine open boolean variable
    var openTime: Date
    var closeTime: Date
    var open: Bool
    
    
    init(operatorID: Int, name: String, address: String, addressName: String, openTime: Date, closeTime: Date) {
        self.operatorID = operatorID
        self.name = name
        self.address = address
        self.addressName = addressName
        self.openTime = openTime
        self.closeTime = closeTime
        self.open = (openTime > Date() && closeTime < Date())
    }
}



