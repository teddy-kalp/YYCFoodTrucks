//
//  Discover.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct Discover: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Sweet Treats")
                .frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(Color.gray)
            }
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
