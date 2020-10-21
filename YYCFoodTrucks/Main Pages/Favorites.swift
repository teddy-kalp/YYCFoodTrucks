//
//  Favorites.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Truck name")
                .frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(Color.gray)
            }
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
