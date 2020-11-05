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

    
    @ObservedObject var LocationRepo = LandMarkRespository()
    @ObservedObject var ScheduleRepo = ScheduleRespository()
    @ObservedObject var favoriteRepo = FavoriteRespository()
    @ObservedObject var TruckRepo = TruckRespository()
    @ObservedObject private var locationManager = LocationManager();
    @ObservedObject var foodCategoryRepo = FoodCategoryRepository();
    
    @State var isActive: Bool = false
    @State var selectedAnnotation: TruckAnnotation?
    
    var testTruck = Truck(name: "testTruck", id: 3, logo: "null", category_id: 0, menu: "null", description: "null")
    
    
    
    var body: some View {
            VStack {
                if router.cur_page == "HomePage"{
                    let userCoords = locationManager.location != nil ? locationManager.location!.coordinate : CLLocationCoordinate2D()
                    yycHeader()
                    NavigationView{
                        GeometryReader {geometry in
                            MapView(annotations: self.getAnnotations(), isActive: self.$isActive, selectedTruck: self.$selectedAnnotation, currentLocation: userCoords)
                            NavigationLink(destination: TruckProfile(truck: self.selectedAnnotation?.truck ?? self.testTruck, schedules: self.ScheduleRepo.schedules, locations: self.LocationRepo.landmarks), isActive: self.$isActive) {
                                EmptyView()
                                    .frame(width: 0, height: 0)
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .border(Color.gray)
                        }
                        .navigationBarTitle("Truck Tracker")
                        .navigationBarHidden(true)
                    }
                
                    NavBar(map: true, discover: false, favorite: false, events: false)
                } else if router.cur_page == "Discover"{
                    yycHeader()
                    Discover(schedules: ScheduleRepo.schedules, locations: LocationRepo.landmarks, trucks: TruckRepo.trucks, foodCategories: foodCategoryRepo.foodCategories)
                    NavBar(map: false, discover: true, favorite: false, events: false)
                } else if router.cur_page == "Favorites"{
                    Favorites(favoriteRepo: favoriteRepo,truckRepo: TruckRepo,schedules: ScheduleRepo.schedules, locations: LocationRepo.landmarks)
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
                var foundTruck = fillerTruck
                var location = fillerLocation
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
                
                let truckAnnotation = TruckAnnotation(truck: foundTruck)
                truckAnnotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                truckAnnotation.title = foundTruck.name
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
                
                
                if (truckAnnotation.truck.open){
                    truckAnnotation.subtitle = "Open Now! Closes at \(closeTime)"
                }
                else if (schedule.openDate > Date()){
                    truckAnnotation.subtitle = "Opens on \(openDate) from \(openTime) to \(closeTime)"
                }
                
                truckAnnotations.append(truckAnnotation)
                // we don't want to map the same truck on the map twice in different locations
                // this is why we don't have two trucks in two different places
//                var foundSameTruck = false
//                for ta in truckAnnotations{
//                    if truckAnnotation.truck.id == ta.truck.id{
//                        foundSameTruck = true
//                        break
//                    }
//                }
//                if (!foundSameTruck){
//                    truckAnnotations.append(truckAnnotation);
//                }
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
