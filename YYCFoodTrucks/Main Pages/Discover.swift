//
//  Discover.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct Discover: View {
    var categ = categories
    var body: some View {
        NavigationView{
            ScrollView{
             ForEach (categ){ category in
                NavigationLink(destination: TruckList(title: category.name, category_id: category.id)){
                    HStack{
                        Image(category.img)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 20, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipped()
                        .cornerRadius(3)
                        }
                    }
                }
            }.navigationBarTitle("Discover", displayMode: .inline)
            .font(.custom("",size: 20))
            
            
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
