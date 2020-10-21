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
    @EnvironmentObject var router: Router
    
    var body: some View {
        HStack(spacing: 30){
                VStack{
                    Button(action: {self.router.cur_page = "HomePage"}){
                        Image(systemName: "map")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(map ? primColor: .black)
                    Text("Truck Tracker")
                        .foregroundColor(map ? primColor: .black)
                    }
                }
                VStack{
                    Button(action: {self.router.cur_page = "Discover"}){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(discover ? primColor: .black)
                        Text("Discover")
                            .foregroundColor(discover ? primColor: .black)
                    }
                }
                VStack {
                    Button(action: {self.router.cur_page = "Favorites"}){
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(favorite ? primColor: .black)
                        Text("Favorites")
                            .foregroundColor(favorite ? primColor: .black)
                    }
                }
                VStack {
                    Button(action: {self.router.cur_page = "Events"}){
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(events ? primColor: .black)
                        Text("Events")
                            .foregroundColor(events ? primColor: .black)
                    }
                }
            //}
        }
    }
}


struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(map: true, discover: false, favorite: false, events: false)
    }
}
