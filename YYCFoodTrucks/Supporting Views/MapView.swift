//
//  MapView.swift
//  TestApp
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI
import MapKit
import FirebaseStorage

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
                    
                if let truckAnnotation = annotation as? TruckAnnotation{
                    
                    let circle = truckAnnotation.truck.open ? UIImage(systemName:"mappin.circle.fill")!.withTintColor(primColorUI):
                    UIImage(systemName:"mappin.circle.fill")!.withTintColor(.red)
                    let size = CGSize(width: 40, height: 40)
                    annotationView?.image = UIGraphicsImageRenderer(size:size).image {
                    _ in circle.draw(in:CGRect(origin:.zero, size:size))
                    }
                    
                    let firebaseImage = FirebaseImage(id: truckAnnotation.truck.logo, width: 50, height: 50)
                    let logo = firebaseImage.image
                    
                    if logo != nil{
                        let logoView = UIImageView(image: logo)
                        logoView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                        annotationView?.leftCalloutAccessoryView = logoView
                    }
                    else{
                        let logoView = UIImageView(image: UIImage(named: "yycfood"))
                        logoView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                        annotationView?.leftCalloutAccessoryView = logoView
                    }
                    
                    
                    annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                    
                    var directionsButton = UIButton(type: .detailDisclosure)
                    
                    if #available(iOS 14.0, *) {
                        directionsButton = UIButton(type: .system, primaryAction: UIAction(title: "Directions", handler: { _ in
                            // this will put the coordinates in the map and deploty the map to open in maps
                            let coordinate = CLLocationCoordinate2DMake(annotation.coordinate.latitude,annotation.coordinate.longitude)
                            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
                            mapItem.name = annotation.title!!
                            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
                            
                        }))
                    }
                    annotationView?.container(arrangedSubviews: [directionsButton])
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
            }
            else {
            // we have a view to reuse, so give it the new annotation
            annotationView?.annotation = annotation
            }
            return annotationView
        }

        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
            self.parent.isActive = true
            self.parent.selectedTruck = (view.annotation as? TruckAnnotation)!
        }
    }
}

extension MKAnnotationView {

    func container(arrangedSubviews: [UIView]) {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.detailCalloutAccessoryView = stackView
    }
}

func directionsPress(){
        print("Button has been pressed")
}



