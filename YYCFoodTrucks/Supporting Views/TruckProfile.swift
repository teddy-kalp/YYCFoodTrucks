//
//  TruckProfile.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct TruckProfile: View {
    @ObservedObject var favoriteRepo = FavoriteRespository();
    
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
                    Group{
                        Spacer()
                        Text("Today's Schedule")
                            .font(.title)
                        Spacer()
                        if (currentScheduleLocation != ("","")){
                            Text(currentScheduleLocation.1)
                                .font(.headline)
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
                    Group{
                        Text("About Us")
                            .font(.title)
                        Text(truck.description)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 20)
                    }
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
                    Text("Menu")
                     .font(.title)
                   
                }.padding(.leading, 10)
                .padding(.trailing, 10)
                Group{
                 menuView
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
                Link(destination: URL(string: "https://www.yycfoodtrucks.com/bookthetrucks")!) {
                    Text("Book This Truck")
                }
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
     return  URLImage(url: self.truck.menu, resizable: true)
        .frame(width: UIScreen.main.bounds.width, height: 500)
              .padding(.bottom, 20)
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
