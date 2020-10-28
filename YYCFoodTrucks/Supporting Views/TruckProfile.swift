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
       var currentScheduleLocation = generateTodaySchedule(schedules: schedules, locations: locations, truck: truck)
       // var upcomingScheduleLocation = generateUpcomingSchedule(schedules: schedules, locations: locations)
        
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
                        Spacer()
                        if (currentScheduleLocation != (nil,nil)){
                            Text(currentScheduleLocation.1!)
                                .font(.headline)
                            Text(currentScheduleLocation.0!)
                                .font(.headline)
                                .padding(.bottom, 20)
                                .foregroundColor(primColor)
                        }
                        else{
                            Text("No Schedule For Today")
                                .font(.headline)
                                .padding(.bottom, 20)
                        }
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
// need to generate upcoming schedules
//func generateUpcomingSchedule(schedules: [Schedule], locations: [LandMark], truck: Truck) -> [(Schedule, LandMark)]{
//
//
//    return nil
//}
// need t
func generateTodaySchedule(schedules: [Schedule], locations: [LandMark], truck: Truck) -> (String?, String?){
    var AddressToReturn: String?
    var TimeToReturn: String?
    
    for schedule in schedules{
        if (schedule.openDate < Date() && Date() < schedule.closeDate){
            if (schedule.truckId == truck.id){
                let hoursMinutes = DateFormatter()
                hoursMinutes.dateFormat = "HH:MM a"
                let openTime = hoursMinutes.string(from: schedule.openDate)
                let closeTime = hoursMinutes.string(from: schedule.closeDate)
                TimeToReturn = "Today \(openTime) - \(closeTime)"
                for location in locations{
                    if (schedule.locationId == location.locationId){
                        AddressToReturn = location.address
                        return(TimeToReturn, AddressToReturn)
                    }
                }
            }
        }
        
    }
    return (nil, nil)
}

/*
struct TruckProfile_Previews: PreviewProvider {
    static var previews: some View {
        TruckProfile(truck: truck)
    }
}
*/
