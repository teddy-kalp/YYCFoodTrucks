//
//  TruckList.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI
import URLImage

struct TruckList: View {
    var title: String
    var category_id: Int
    var truck_list = trucks
    var body: some View {
        ScrollView{
            Spacer()
                .frame(height: 50)
            ForEach(truck_list){ truck in
                if truck.category_id == self.category_id{
                    HStack{
                        NavigationLink(destination: TruckProfile()){
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
