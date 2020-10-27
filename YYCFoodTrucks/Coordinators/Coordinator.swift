//
//  Coordinator.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-26.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate{
    
    var control: MapView
    init(_ control: MapView){
        self.control = control
    }
    
    
}
