//
//  MapView.swift
//  TestApp
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var landMarks: [LandMark];
    var trucks: [Truck];
    var schedules: [Schedule];
    
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ map: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let calgary = CLLocationCoordinate2D(latitude: 51.0447, longitude: -114.0719)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        // use this to center the map on user's current location
        // let region = MKCoordinateRegion(center: coodinate, span: span)
        let region = MKCoordinateRegion(center: calgary, span: span)
        map.setRegion(region, animated: true)
        
        // query through all the schedules in the database
        // add annotations
        for schedule in schedules{
            if (schedule.openDate < Date() && Date() < schedule.closeDate){
                let truckId = schedule.truckId;
                let landmarkId = schedule.locationId
                var tr: Truck? = nil
                var lm: LandMark? = nil
                // find the truck details
                for truck in trucks{
                    if (truck.id == truckId){
                        tr = truck
                        break
                    }
                }
                // find the landmark details
                for landmark in landMarks{
                    if (landmark.landmarkId == landmarkId){
                        lm = landmark
                        break
                    }
                }
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: lm!.latitude, longitude: lm!.longitude)
                annotation.title = tr!.name
                map.addAnnotation(annotation)
            }
        }
    }
    
    
}

