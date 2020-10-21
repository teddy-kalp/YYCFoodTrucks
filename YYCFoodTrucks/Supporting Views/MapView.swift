//
//  MapView.swift
//  TestApp
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var landMarks = LandMarkRespository();
    
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ map: MKMapView, context: Context) {
        
        let mainCoordinate = CLLocationCoordinate2D(latitude: 51.0447, longitude: -114.0719)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: mainCoordinate, span: span)
        
        // this is how to make an annotation to a MapKit UI
        //let annotation = MKPointAnnotation()
        //annotation.coordinate = CLLocationCoordinate2D(latitude: 50.726300, longitude: -113.988410)
        
        map.setRegion(region, animated: true)
        // this is how to add an annotation to a MapKitUI
        //map.addAnnotation(annotation)
        for lm in landMarks.landmarks{
                let annotation = MKPointAnnotation()
                print(lm.latitude)
                print(lm.longitude)
                annotation.coordinate = CLLocationCoordinate2D(latitude: lm.latitude, longitude: lm.longitude)
                map.addAnnotation(annotation)
            }
        }
    }

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
