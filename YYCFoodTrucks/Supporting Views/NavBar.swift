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
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 50, height: 45)
                        .foregroundColor(map ? primColor: .black)
                    Text("Truck Tracker")
                        .foregroundColor(map ? primColor: .black)
                }
                VStack{
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 50, height: 45)
                        .foregroundColor(discover ? primColor: .black)
                    Text("Discover")
                        .foregroundColor(discover ? primColor: .black)
                }
                VStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 50, height: 45)
                        .foregroundColor(favorite ? primColor: .black)
                    Text("Favorites")
                        .foregroundColor(favorite ? primColor: .black)
                }
                VStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 50, height: 45)
                        .foregroundColor(events ? primColor: .black)
                    Text("Events")
                        .foregroundColor(events ? primColor: .black)
            }
        }
    }
}


struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(map: true, discover: false, favorite: false, events: false)
    }
}