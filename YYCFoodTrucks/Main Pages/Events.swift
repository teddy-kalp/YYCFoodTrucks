//
//  Events.swift
//  YYCFoodTrucks
//
//  Created by Bojana on 2020-10-27.
//

import SwiftUI

struct Events: View {
    var body: some View {
        NavigationView{
            VStack {
                Webview(url: "https://www.yycfoodtrucks.com/events")
            }
        }
    }
}

struct Events_Previews: PreviewProvider {
    static var previews: some View {
        Events()
    }
}
