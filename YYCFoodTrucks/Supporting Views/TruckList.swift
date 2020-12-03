//
//  TruckList.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct TruckList: View {
    var locations: [Location]
    var schedules: [Schedule]
    var trucks: [Truck]
    var title: String
    var category_id: Int
    //var truck_list = trucks
    var body: some View {
        ScrollView{
            ForEach(trucks){ truck in
                if (truck.category_id == self.category_id && truck.open){
                    TruckCard(truck: truck, schedules: schedules, locations: locations)
                }
            }
            ForEach(trucks){ truck in
                if (truck.category_id == self.category_id && !truck.open){
                    TruckCard(truck: truck, schedules: schedules, locations: locations)
                }
            }
        }
            .navigationBarTitle(Text(title))
    }
}


struct TruckCard: View{
    var truck: Truck
    var schedules: [Schedule]
    var locations: [Location]
    
    var body: some View{
            HStack{
                NavigationLink(destination: TruckProfile(truck: truck, schedules: schedules, locations: locations)){
                FirebaseImage(id:(truck.logo), width: Int(UIScreen.main.bounds.width/4), height: 175/2)
                VStack{
                    Text(truck.name)
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                    if (truck.open){
                        Text("Open Now")
                        .foregroundColor(primColor)
                    }
                    else{
                        Text("Closed Now")
                        .foregroundColor(.red)
                    }
                }
                .frame(width: 200, height: 200, alignment: .center)
            }
        }
        .frame(width: (UIScreen.main.bounds.size.width), height: 100)
        .border(primColor, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .padding(.bottom, -10)
    }
}

