//
//  ContentView.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI
import MapKit


struct HomePage: View {
    @EnvironmentObject var router: Router
    @ObservedObject var TruckRepo = TruckRespository()
    @ObservedObject var LocationRepo = LandMarkRespository()
    @ObservedObject var ScheduleRepo = ScheduleRespository()
    
    @State var isActive: Bool = false
    @State var selectedAnnotation: TruckAnnotation?
    
    var body: some View {
            VStack {
                yycHeader()
                if router.cur_page == "HomePage"{
                    GeometryReader { geometry in
                        MapView(annotations: getAnnotations(), isActive: $isActive, selectedTruck: $selectedAnnotation)
                        .frame(width: geometry.size.width, height: geometry.size.height - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .border(Color.gray)
                    }
                    NavBar(map: true, discover: false, favorite: false, events: false)
                } else if router.cur_page == "Discover"{
                    Discover()
                    NavBar(map: false, discover: true, favorite: false, events: false)
                } else if router.cur_page == "Favorites"{
                    Favorites()
                    NavBar(map: false, discover: false, favorite: true, events: false)
                } else {
                    Events()
                    NavBar(map: false, discover: false, favorite: false, events: true)
                }
            }
        }
    
    func getAnnotations() -> [TruckAnnotation]{
        var truckAnnotations = [TruckAnnotation]()
        for schedule in ScheduleRepo.schedules{
            if (schedule.closeDate < Date()){
                continue
            }
            else{
                var foundTruck: Truck?
                var location: LandMark?
                for tr in TruckRepo.trucks{
                    if (tr.id == schedule.truckId){
                        foundTruck = tr
                        break
                    }
                }
                for lc in LocationRepo.landmarks{
                    if (lc.locationId == schedule.locationId){
                        location = lc
                        break
                    }
                }
                let truckAnnotation = TruckAnnotation(truck: foundTruck!)
                truckAnnotation.coordinate = CLLocationCoordinate2D(latitude: location!.latitude, longitude: location!.longitude)
                truckAnnotation.title = foundTruck!.name
                // different formators for the dates
                let hoursMinutes = DateFormatter()
                hoursMinutes.dateFormat = "HH:MM"
                // different formators for the dates
                let monthDayYear = DateFormatter()
                monthDayYear.dateFormat = "MMM dd,yyyy"
                
                let openTime = hoursMinutes.string(from: schedule.openDate)
                let closeTime = hoursMinutes.string(from: schedule.closeDate)
                let openDate = monthDayYear.string(from: schedule.openDate)
                //let closeDate = monthDayYear.string(from: schedule.closeDate)
                
                
                if (schedule.openDate < Date() && Date() < schedule.closeDate){
                    truckAnnotation.subtitle = "Open Now! Closes at \(closeTime)"
                    truckAnnotation.truck.open = true
                }
                else if (schedule.openDate > Date()){
                    truckAnnotation.subtitle = "Opens Soon! \(openDate) from \(openTime) to \(closeTime)"
                    truckAnnotation.truck.open = false
                }
                
                truckAnnotations.append(truckAnnotation);
            }
        }
        return truckAnnotations;
    }
}
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
