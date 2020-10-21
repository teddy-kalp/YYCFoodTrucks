//
//  Events.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct Events: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Event name")
                .frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(Color.gray)
            }
        }
    }
}

struct Events_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
