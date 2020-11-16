//
//  Location.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import Foundation
import CoreLocation


class Location: Identifiable, Codable {
    var address: String
    var latitude: Double
    var longitude: Double
    var locationId: String?
    
    init(address: String, latitude: Double, longitude: Double) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
}



