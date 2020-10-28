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
        let currentScheduleLocation = generateTodaySchedule(schedules: schedules, locations: locations, truck: truck)
        let upcomingScheduleLocation = generateUpcomingSchedule(schedules: schedules, locations: locations, truck: truck)
        
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
                        Text(self.truck.description)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 20)
                    }
                    Group{
                        //Spacer()
                        Text("Upcoming schedule")
                            .font(.title)
                        Spacer()
                        ForEach(upcomingScheduleLocation){ variable in
                            Text(variable)
                                .font(.body)
                            Spacer()
                        }
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
func generateUpcomingSchedule(schedules: [Schedule], locations: [LandMark], truck: Truck) -> [String]{
    var scheduleLocations = [String] ()
    
    let hoursMinutes = DateFormatter()
    hoursMinutes.dateFormat = "HH:MM a"
    
    let monthDayYear = DateFormatter()
    monthDayYear.dateFormat = "MMM dd,yyyy"
    
    for schedule in schedules{
        if (schedule.openDate > Date() && schedule.truckId == truck.id){
            let openTime = hoursMinutes.string(from: schedule.openDate)
            let openDate = monthDayYear.string(from: schedule.openDate)
            let closeTime = hoursMinutes.string(from: schedule.closeDate)
            
            let sched = "\(openDate) from \(openTime) - \(closeTime)"
            
            for location in locations{
                if (schedule.locationId == location.locationId){
                    scheduleLocations.append("\(location.address)\n\(sched)")
                }
            }
            
        }
    }

    
    return scheduleLocations
}

func generateTodaySchedule(schedules: [Schedule], locations: [LandMark], truck: Truck) -> (String, String){
    var AddressToReturn = ""
    var TimeToReturn = ""
    
    let hoursMinutes = DateFormatter()
    hoursMinutes.dateFormat = "HH:MM a"
    
    for schedule in schedules{
        if (schedule.openDate < Date() && Date() < schedule.closeDate && schedule.truckId == truck.id){
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
    return (TimeToReturn, AddressToReturn)
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
