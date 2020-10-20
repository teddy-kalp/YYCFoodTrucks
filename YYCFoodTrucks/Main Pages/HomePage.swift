//
//  ContentView.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI


struct HomePage: View {
    var body: some View {
            VStack {
                yycHeader()
                MapView()
                    .frame(width: 600, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .border(Color.gray)
                NavBar(map: true, discover: false, favorite: false, events: false)
                }
        }
}
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
