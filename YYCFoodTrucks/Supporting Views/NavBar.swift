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

struct NavBar: View {
    var map: Bool
    var discover: Bool
    var favorite: Bool
    var events: Bool
    @EnvironmentObject var router: Router
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 30){
                var baseColor = (colorScheme == .light) ? Color.black : Color.white
                Button(action: {self.router.cur_page = "HomePage"}){
                    VStack{
                        Image(systemName: "map")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(map ? primColor: baseColor)
                    Text("Truck Tracker")
                        .foregroundColor(map ? primColor: baseColor)
                    }
                    
                }
                Button(action: {self.router.cur_page = "Discover"}){
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(discover ? primColor: baseColor)
                        Text("Discover")
                            .foregroundColor(discover ? primColor: baseColor)
                    }
                }
                Button(action: {self.router.cur_page = "Favorites"}){
                    VStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(favorite ? primColor: baseColor)
                        Text("Favorites")
                            .foregroundColor(favorite ? primColor: baseColor)
                    }
                }
                Button(action: {self.router.cur_page = "Events"}){
                    VStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(events ? primColor: baseColor)
                        Text("Events")
                            .foregroundColor(events ? primColor: baseColor)
                    }
                }
            }
        }
}



struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(map: true, discover: false, favorite: false, events: false)
    }
}
