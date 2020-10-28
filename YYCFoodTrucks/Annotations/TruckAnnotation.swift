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
    
    init(truck: Truck){
        self.truck = truck
    }
}
