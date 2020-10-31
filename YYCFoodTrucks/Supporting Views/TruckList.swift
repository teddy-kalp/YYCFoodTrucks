//
//  TruckList.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct TruckList: View {
    var locations: [LandMark]
    var schedules: [Schedule]
    var title: String
    var category_id: Int
    //var truck_list = trucks
    @ObservedObject var truck_list = TruckRespository()
    var body: some View {
        ScrollView{
            Spacer()
                .frame(height: 50)
            ForEach(truck_list.trucks){ truck in
                if truck.category_id == self.category_id{
                    HStack{
                        NavigationLink(destination: TruckProfile(truck: truck, schedules: schedules, locations: locations)){
                            FirebaseImage(id:(truck.logo), width: Int(UIScreen.main.bounds.width), height: 350)
                            Spacer()
                        }
                    }.frame(width: 400, height: 350)
                }
            }.navigationBarTitle(Text(title))
        }
    }
}

struct TruckList_Previews: PreviewProvider {
    static var previews: some View {
        TruckList(locations: testLocations, schedules: testSchedules, title: "title", category_id: -1)
    }
}
