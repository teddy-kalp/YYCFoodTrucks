//
//  Discover.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct Discover: View {
    var schedules: [Schedule]
    var locations: [LandMark]
    var trucks: [Truck]
    
    @ObservedObject var foodCategoryRepo = FoodCategoryRepository();
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach (foodCategoryRepo.foodCategories){ category in
                    NavigationLink(destination: TruckList(locations: locations, schedules: schedules, trucks: trucks, title: category.name, category_id: category.id)){
                    HStack{
                        Image(category.img)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 20, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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


