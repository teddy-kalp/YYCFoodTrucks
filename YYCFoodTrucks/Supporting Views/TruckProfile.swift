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
    var locations: [Location]
    
    
    var body: some View {
        ScrollView{
            FirebaseImage(id:(truck.logo), width: Int(UIScreen.main.bounds.width), height: 300)
            VStack(alignment: .leading){
                    truckNameView
                    schedulesView
                    truckDescriptionView
                    upcomingSchedulesView
                if (truck.menu != "null"){
                    menuView
                    }
                }
        }
    }
    
    
    var truckNameView: some View{
        Group{
            HStack{
               Text(truck.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
            Spacer()
                    if favoriteRepo.checkTruckID(truck_id: truck.id){
                        Button(action: {favoriteRepo.removeFavorite(truck_id: truck.id)}){
                            Image(systemName: "heart.fill")
                               .resizable()
                               .frame(width: CGFloat(30), height: CGFloat(30))
                               .foregroundColor(primColor)
                               .padding(.trailing, 10)
                        }
                    } else {
                        Button(action: {favoriteRepo.addFavorite(truck_id: truck.id)}){
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: CGFloat(30), height: CGFloat(30))
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
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
    
    var schedulesView: some View{
        let currentScheduleLocation = generateTodaySchedule(schedules: schedules, locations: locations, truck: truck)
        return Group{
            Spacer()
            Text("Today's Schedule")
                .font(.title)
                .padding(.leading, 5)
            Spacer()
            if ((currentScheduleLocation != ("","", 0, 1))){
                HStack{
                    Text(currentScheduleLocation.1)
                        .font(.headline)
                        .padding(.leading, 5)
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
                    .padding(.bottom, 10)
                    .padding(.leading, 5)
                    .foregroundColor(.red)
            }
        }
    }

    var truckDescriptionView: some View {
        return Group{
            if (truck.description != ""){
                Text("About Us")
                    .font(.title)
                    .padding(.leading, 5)
                Text(truck.description)
                    .font(.body)
                    .padding(.bottom, 20)
                    .padding(.leading, 5)
            }
        }
        .frame(alignment: .center)
    }
    
    var upcomingSchedulesView: some View{
        let upcomingScheduleLocation = generateUpcomingSchedule(schedules: schedules, locations: locations, truck: truck)
        return Group{
            //Spacer()
            Text("Upcoming schedule")
                .font(.title)
                .padding(.leading, 5)
            Spacer()
            if (upcomingScheduleLocation.count == 0){
                Text("Nothing scheduled yet but check back soon!")
                    .font(.body)
                    .padding(.leading, 5)
            }
            else{
                ForEach(upcomingScheduleLocation){ schedule in
                    Text(schedule)
                        .font(.body)
                        .padding(.leading, 5)
                    Spacer()
                }
            }
        }
    }
    
    var menuView: some View {
        return Group{
            Text("Menu")
             .font(.title)
                .padding(.leading, 5)
            FirebaseImage(id: self.truck.menu, width: Int(UIScreen.main.bounds.width), height: 500)
        }
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
