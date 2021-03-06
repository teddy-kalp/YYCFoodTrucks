//
//  yycHeader.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct yycHeader: View {
    @EnvironmentObject var router: Router
    // this variable is used for the colorScheme that the iPhone uses
    // the colorScheme variable can either be .dark or .light
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: {self.router.cur_page = "HomePage"}){
            Image(colorScheme == .light ? "yycfood":"yycfood_white")
            .resizable()
            .frame(width: 80, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
    }
}


struct yycHeader_Previews: PreviewProvider {
    static var previews: some View {
        yycHeader()
    }
}

