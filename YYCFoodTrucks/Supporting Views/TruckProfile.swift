//
//  TruckProfile.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI
import MapKit
struct TruckProfile: View {
    @ObservedObject var favoriteRepo = FavoriteRespository();
    @State var directionsAlert = false
    var truck: Truck
    var schedules: [Schedule]
    var locations: [LandMark]
    
    
    var body: some View {
        let currentScheduleLocation = generateTodaySchedule(schedules: schedules, locations: locations, truck: truck)
        let upcomingScheduleLocation = generateUpcomingSchedule(schedules: schedules, locations: locations, truck: truck)
        
        ScrollView{
            FirebaseImage(id:(truck.logo), width: Int(UIScreen.main.bounds.width), height: 300)
            VStack(alignment: .leading){
                    truckNameView
                    /*Text(self.truck.address)
                        .font(.subheading)*/
                    schedulesView
                    Group{
                        if (truck.description != ""){
                            Text("About Us")
                                .font(.title)
                            Text(truck.description)
                                .font(.body)
                                .padding(.bottom, 20)
                        }
                    }
                    .frame(alignment: .center)
                    Group{
                        //Spacer()
                        Text("Upcoming schedule")
                            .font(.title)
                        Spacer()
                        if (upcomingScheduleLocation.count == 0){
                            Text("Nothing scheduled yet but check back soon!")
                                .font(.body)
                        }
                        else{
                            ForEach(upcomingScheduleLocation){ variable in
                                Text(variable)
                                    .font(.body)
                                Spacer()
                            }
                        }
                    }
                if (truck.menu != "null"){
                    Text("Menu")
                     .font(.title)
                    menuView
                    }
                }
        }
        .frame(width: UIScreen.main.bounds.size.width/4 - 20)
    }
    
    var schedulesView: some View{
        let currentScheduleLocation = generateTodaySchedule(schedules: schedules, locations: locations, truck: truck)
        return Group{
            Spacer()
            Text("Today's Schedule")
                .font(.title)
            Spacer()
            if ((currentScheduleLocation != ("","", 0, 1))){
                HStack{
                    Text(currentScheduleLocation.1)
                        .font(.headline)
                    Button(action:{
                        directionsAlert.toggle()
                    }){
                    Text("Directions")
                        .padding(.leading, UIScreen.main.bounds.size.width/4)
                    }
                    Image(systemName: "arrow.triangle.turn.up.right.diamond")
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                }
                .alert(isPresented: $directionsAlert) { () -> Alert in
                            let primaryButton = Alert.Button.default(Text("Yes")) {
                                let coordinate = CLLocationCoordinate2DMake(currentScheduleLocation.2,currentScheduleLocation.3)
                                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
                                mapItem.name = currentScheduleLocation.1
                                mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
                            }
                            let secondaryButton = Alert.Button.cancel(Text("No")) {
                                directionsAlert.toggle()
                            }
                            return Alert(title: Text("Leaving Application To Maps"), message: Text("Do you want to leave?"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                        }
                Text(currentScheduleLocation.0)
                    .font(.headline)
                    .padding(.bottom, 20)
                    .foregroundColor(primColor)
                
            }
            else{
                Text("Closed Today")
                    .font(.headline)
                    .padding(.bottom, 20)
                    .foregroundColor(.red)
            }
        }
    }
    
    var truckNameView: some View{
        Group{
            HStack{
               Text(truck.name)
                   .font(.title)
                   .fontWeight(.bold)
            Spacer()
                    if favoriteRepo.checkTruckID(truck_id: truck.id){
                        Button(action: {favoriteRepo.removeFavorite(truck_id: truck.id)}){
                            Image(systemName: "heart.fill")
                               .resizable()
                               .frame(width: CGFloat(30), height: CGFloat(30))
                               .foregroundColor(primColor)
                        }
                    } else {
                        Button(action: {favoriteRepo.addFavorite(truck_id: truck.id)}){
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: CGFloat(30), height: CGFloat(30))
                                .foregroundColor(.black)
                        }
                    }
                
            }
            if #available(iOS 14.0, *) {
                Group{
                    Link(destination: URL(string: "https://www.yycfoodtrucks.com/bookthetrucks")!) {
                        Text("Book This Truck")
                            .padding()
                            .border(Color.blue, width: 4)
                    }
                }
                .frame(width: (UIScreen.main.bounds.size.width), height: 80, alignment: .center)
                
            } else {
                // Fallback on earlier versions
                
            }
        }
    }
    
    var currentLocationView: some View{
        Group{
            Text("2500 University Avenue, Calgary, AB T2N1N4")
             .font(.subheadline)
                .foregroundColor(Color.gray)
             Text("2PM - 6PM")
                .font(.subheadline)
                .padding(.bottom, 20)
                .foregroundColor(Color.gray)
        }
    }
    var menuView: some View {
        
        return FirebaseImage(id: self.truck.menu, width: Int(UIScreen.main.bounds.width), height: 500)
//     return  URLImage(url: self.truck.menu, resizable: true)
//        .frame(width: UIScreen.main.bounds.width, height: 500)
//              .padding(.bottom, 20)
    }
    
}


extension String: Identifiable {
    public var id: String {
        self
    }
}

/*
struct TruckProfile_Previews: PreviewProvider {
    static var previews: some View {
        TruckProfile(truck: truck)
    }
}
*/
