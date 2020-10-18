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
            
            NavBar(map: false, discover: true, favorite: false, events: false)
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
