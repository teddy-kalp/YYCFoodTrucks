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
    
    // used for trucks, landmarks and schedules
    @ObservedObject var TruckRepository = TruckRespository()
    @ObservedObject var LandMarkRespositoy = LandMarkRespository()
    @ObservedObject var ScheduleRepo = ScheduleRepository()
    
    // used for current location
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
            VStack {
                yycHeader()
                let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
                if router.cur_page == "HomePage"{
                    GeometryReader { geometry in
                        MapView(landMarks: LandMarkRespositoy.landmarks, trucks: TruckRepository.trucks, schedules: ScheduleRepo.schedules, coordinate: coordinate)
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
                } else if router.cur_page == "Events"{
                    Events()
                    NavBar(map: false, discover: false, favorite: false, events: true)
                }
                else{
                    OperatorLogin()
                    NavBar(map: false, discover: false, favorite: false, events: false)
                }
            }
        }
}
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
