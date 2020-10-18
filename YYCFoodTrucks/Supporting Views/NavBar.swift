//
//  NavBar.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

// TODO
// Add clauses to change color depending on which screen
// Space icons out better

import SwiftUI

let primColor = Color(red: 0, green: 0.7, blue: 0.6, opacity: 1)

struct NavBar: View {
    var map: Bool
    var discover: Bool
    var favorite: Bool
    var events: Bool
    
    var body: some View {
        HStack(spacing: 30){
                VStack{
                    if (map){
                        Image("mapClicked")
                            .resizable()
                            .frame(width: 50, height: 45)
                            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                
                            })
                        Text("Truck Tracker")
                            .foregroundColor(primColor)
                    }
                    else{
                        Image("map")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Truck Tracker")
                            .foregroundColor(.black)
                    }
                }
                VStack{
                    if (discover){
                        Image("discoverClicked")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Discover")
                            .foregroundColor(primColor)
                    }
                    else{
                        Image("discover")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Discover")
                            .foregroundColor(.black)
                    }
                }
                VStack {
                    if (favorite){
                        Image("favoriteClicked")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Favorites")
                            .foregroundColor(primColor)
                    }
                    else{
                        Image("favorite")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Favorites")
                            .foregroundColor(.black)
                    }
                }
                VStack {
                    if (events){
                        Image("eventsClicked")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Events")
                            .foregroundColor(primColor)
                    }
                    else{
                        Image("events")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Events")
                            .foregroundColor(.black)
                        
                    }
            }
        }
    }
}


struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(map: false, discover: true, favorite: true, events: true)
    }
}
