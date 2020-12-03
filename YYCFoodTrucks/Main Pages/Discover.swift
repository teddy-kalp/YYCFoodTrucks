//
//  Discover.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct Discover: View {
    var schedules: [Schedule]
    var locations: [Location]
    var trucks: [Truck]
    var foodCategories: [FoodCategory]
    
    @State var searchText = ""

    
    var body: some View {
        NavigationView{
            ScrollView{
                SearchBar(text: $searchText)
                    .padding(.top, 20)
                
                if (searchText == ""){
                    ForEach (foodCategories){ category in
                        FoodCategoryCard(locations: locations, schedules: schedules, trucks: trucks, category: category)
                    }
                }
                else{
                    let filteredTrucks = trucks.filter { $0.name.contains(searchText) }
                    ForEach(filteredTrucks){ truck in
                        if (truck.open){
                            TruckCard(truck: truck, schedules: schedules, locations: locations)
                        }
                    }
                    ForEach(filteredTrucks){ truck in
                        if (!truck.open){
                            TruckCard(truck: truck, schedules: schedules, locations: locations)
                        }
                    }
                }
            }
            .navigationBarTitle("Discover", displayMode: .inline)
            .font(.custom("",size: 20))
        }
    }
}

struct FoodCategoryCard: View {
    var locations: [Location]
    var schedules: [Schedule]
    var trucks: [Truck]
    var category: FoodCategory
    
    
    var body: some View{
        NavigationLink(destination: TruckList(locations: locations, schedules: schedules, trucks: trucks, title: category.name, category_id: category.id)){
        HStack{
            FirebaseImage(id: category.img, width: Int(UIScreen.main.bounds.width) - 20, height: 150)
                .frame(width: UIScreen.main.bounds.width - 20, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
            .cornerRadius(3)
            }
        }
    }
}

struct SearchBar: View{
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View{
            HStack{
            TextField("Search ...", text: $text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                 
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }){
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                        }
                    }
                )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
            }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
    
}


