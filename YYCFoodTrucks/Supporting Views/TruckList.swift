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
    var trucks: [Truck]
    var title: String
    var category_id: Int
    //var truck_list = trucks
    var body: some View {
        ScrollView{
            Spacer()
                .frame(height: 50)
            ForEach(trucks){ truck in
                if truck.category_id == self.category_id{
                    HStack{
                        NavigationLink(destination: TruckProfile(truck: truck, schedules: schedules, locations: locations)){
                            FirebaseImage(id:(truck.logo), width: Int(UIScreen.main.bounds.width), height: 350)
                        }
                    }.frame(width: 400, height: 350)
                }
            }.navigationBarTitle(Text(title))
        }
    }
}

