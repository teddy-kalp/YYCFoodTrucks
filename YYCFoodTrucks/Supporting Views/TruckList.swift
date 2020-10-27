//
//  TruckList.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI
import URLImage

struct TruckList: View {
    @ObservedObject var truck_list = TruckRespository()
    var title: String
    var category_id: Int
    var body: some View {
        ScrollView{
            Spacer()
                .frame(height: 50)
            ForEach(truck_list.trucks){ truck in
                if truck.category_id == self.category_id{
                    HStack{
                        NavigationLink(destination: TruckProfile(truck: truck)){
                            URLImage(url: truck.img)
                        }
                    }.frame(width: 400, height: 250)
                }
            }.navigationBarTitle(Text(title))
        }
    }
}

struct TruckList_Previews: PreviewProvider {
    static var previews: some View {
        TruckList(title: "title", category_id: -1)
    }
}