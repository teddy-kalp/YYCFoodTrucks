//
//  Truck.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import Foundation

class Truck: Identifiable, Codable {
    var name: String
    var open: Bool
    
    init(name: String, open: Bool) {
        self.name = name
        self.open = open
    }
}



