//
//  TruckProfile.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct TruckProfile: View {
    var truck: Truck
    var schedules: [Schedule]
    var locations: [LandMark]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                    URLImage(url: self.truck.img)
                        .frame(width: CGFloat(400), height: 300)
                    HStack{
                        Text(self.truck.name)
                            .font(.title)
                            .fontWeight(.bold)
                    Spacer()

                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: CGFloat(30), height: CGFloat(30))
                        .foregroundColor(.black)
                    }
                    /*Text(self.truck.address)
                        .font(.subheading)*/
                    Group{
                        Spacer()
                        Text("Today's Schedule")
                            .font(.title)
                        Text("2500 University Avenue, Calgary, AB T2N1N4")
                            .font(.headline)
                        Text("Today 2PM - 6PM")
                            .font(.headline)
                            .padding(.bottom, 20)
                            .foregroundColor(primColor)
                    }
                    Group{
                        Text("About Us")
                            .font(.title)
                        Text(self.truck.description)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 20)
                    }
                    Group{
                        //Spacer()
                        Text("Upcoming schedule").font(.title)
                        Text("No schedule")
                        .padding(.bottom, 20)
                    }
                    Group{
                        if (self.truck.menu != "null"){
                            //Spacer()
                            Text("Menu")
                            .font(.title)
                            URLImage(url: self.truck.menu)
                                .frame(width: UIScreen.main.bounds.width - 5)
                                .padding(.bottom, 20)
                        }
                    }
            }.padding()
        }
    }
}
//// need to generate upcoming schedules
//func generateUpcomingSchedule(schedules: [Schedule]) -> [(Schedule, LandMark)]{
//    
//}
//// need t
//func generateTodaySchedule(schedules: [Schedule], locations: [LandMark]) -> (Schedule, LandMark){
//    
//}

/*
struct TruckProfile_Previews: PreviewProvider {
    static var previews: some View {
        TruckProfile(truck: truck)
    }
}
*/
