//
//  EventAnnotation.swift
//  YYCFoodTrucks
//
//  Created by Bojana on 2020-11-08.
//

import Foundation
import MapKit

class EventAnnotation: MKPointAnnotation{
    var event: Event
    
    init(event: Event){
        self.event = event
    }
}
