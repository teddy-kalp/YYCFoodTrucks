//
//  Location.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import Foundation
import CoreLocation


struct LandMark {
    var name: String
    var address: String
    var open: Bool
    var coords: (CLLocationDegrees, CLLocationDegrees)
    
}

let Locations = [
    LandMark(name: "Location 1", address: "2500 University Avenue, Calgary, AB T2N1N4", open: true, coords: (51.076340, -114.131520)),
    LandMark(name: "Location 2", address: "819 4 Avenue NW, Calgary, AB", open: false, coords: (51.057700, -114.082170)),
    LandMark(name: "Location 3", address: "1527 23 Street NW, Calgary, AB T2N2P6", open: false, coords: (51.066000, -114.116850))
]


// used to convert addresses to lats and longs
func convertToCoords(address: String) -> (CLLocationDegrees, CLLocationDegrees){
    let geocoder = CLGeocoder()
    var lat: CLLocationDegrees = 0
    var lon: CLLocationDegrees = 0
    geocoder.geocodeAddressString(address){
        placemarks, error in
        let placemark = placemarks?.first
        lat = placemark?.location?.coordinate.latitude ?? 0
        lon = placemark?.location?.coordinate.longitude ?? 0
    }

    return (lat, lon)
}


