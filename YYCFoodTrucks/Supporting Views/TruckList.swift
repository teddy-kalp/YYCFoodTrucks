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
            ForEach(trucks){ truck in
                if truck.category_id == self.category_id{
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
                    .frame(width: 400, height: 200)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationBarTitle(Text(title))
        }
    }
}

