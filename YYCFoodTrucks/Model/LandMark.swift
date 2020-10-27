//
//  Location.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import Foundation
import CoreLocation


class LandMark: Identifiable, Codable {
<<<<<<< HEAD
    var name: String
    var address: String
    var coords: [Int]
}

=======
    var address: String
    var latitude: Double
    var longitude: Double
    var landmarkId: Int
    
    init(address: String, latitude: Double, longtitude: Double, landmarkId: Int)
    {
        self.address = address
        self.latitude = latitude
        self.longitude = longtitude
        self.landmarkId = landmarkId
    }
}


>>>>>>> e6abc10205599d158c4af91cecdd71c28f1c1920
// used to convert addresses to lats and longs -> still trying to get to work
func convertToCoords(address: String) -> (CLLocationDegrees, CLLocationDegrees){
    let geocoder = CLGeocoder()
    var lat: CLLocationDegrees = 0
    var lon: CLLocationDegrees = 0
    geocoder.geocodeAddressString(address){
        placemarks, error in
        let placemark = placemarks?.first
<<<<<<< HEAD
        lat = placemark?.location?.coordinate.latitude ?? 0
        lon = placemark?.location?.coordinate.longitude ?? 0
    }

    return (lat, lon)
}

=======
        print(error)
        lat = placemark?.location?.coordinate.latitude ?? 0
        print("Lat", placemark?.location?.coordinate.latitude)
        lon = placemark?.location?.coordinate.longitude ?? 0
    }
    print("lat:", lat)
    print("lon:", lon)
    return (lat, lon)
}


>>>>>>> e6abc10205599d158c4af91cecdd71c28f1c1920
//let Locations = [
//    LandMark(name: "Location 1", address: "2500 University Avenue, Calgary, AB T2N1N4", coords: (51.076340, -114.131520)),
//    LandMark(name: "Location 2", address: "819 4 Avenue NW, Calgary, AB", coords: (51.057700, -114.082170)),
//    LandMark(name: "Location 3", address: "1527 23 Street NW, Calgary, AB T2N2P6", coords: (51.066000, -114.116850))
//]




<<<<<<< HEAD


=======
>>>>>>> e6abc10205599d158c4af91cecdd71c28f1c1920
