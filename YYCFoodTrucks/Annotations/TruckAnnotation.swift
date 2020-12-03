//
//  TruckAnnotation.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-27.
//

import Foundation
import MapKit

class TruckAnnotation: MKPointAnnotation{
    var truck: Truck
    var open: Bool = false
    
    init(truck: Truck){
        self.truck = truck
    }
}
