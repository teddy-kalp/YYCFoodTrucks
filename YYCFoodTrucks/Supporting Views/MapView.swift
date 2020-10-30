//
//  MapView.swift
//  TestApp
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    var annotations: [TruckAnnotation]
    @Binding var isActive: Bool
    @Binding var selectedTruck: TruckAnnotation?
    var currentLocation: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ map: MKMapView, context: Context) {
        let calgary = CLLocationCoordinate2D(latitude: 51.0447, longitude: -114.0719)
        let span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        // use this to center the map on user's current location
        //let region = MKCoordinateRegion(center: currentLocation, span: span)
        let region = MKCoordinateRegion(center: calgary, span: span)
        map.setRegion(region, animated: true)

        for annotation in self.annotations{
        map.addAnnotation(annotation)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        init(_ parent: MapView) {
        self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // this is our unique identifier for view reuse
            let identifier = "Placemark"

            // attempt to find a cell we can recycle
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
            // we didn't find one; make a new one
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)

            // allow this to show pop up information
            annotationView?.canShowCallout = true

            // attach an information button to the view
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
            // we have a view to reuse, so give it the new annotation
            annotationView?.annotation = annotation
            }

            // change color of truckannotation depending of if its open or not
            if let truckAnnotation = annotation as? TruckAnnotation{
            let circle = truckAnnotation.truck.open ? UIImage(systemName:"mappin.circle.fill")!.withTintColor(primColorUI):
            UIImage(systemName:"mappin.circle.fill")!.withTintColor(.red)
            let size = CGSize(width: 40, height: 40)
            annotationView?.image = UIGraphicsImageRenderer(size:size).image {
            _ in circle.draw(in:CGRect(origin:.zero, size:size))
            }
            }
            // if its not a truck annotation, it is a pin for user
            else{
            let image =  UIImage(systemName:"largecircle.fill.circle")!.withTintColor(.systemBlue)
            let size = CGSize(width: 20, height: 20)
            annotationView?.image = UIGraphicsImageRenderer(size:size).image {
            _ in image.draw(in:CGRect(origin:.zero, size:size))
            }
            annotationView?.canShowCallout = false
            }

            return annotationView
        }

        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
            self.parent.isActive = true
            self.parent.selectedTruck = (view.annotation as? TruckAnnotation)!
        }
    }
}

