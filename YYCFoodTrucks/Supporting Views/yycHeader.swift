//
//  yycHeader.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct yycHeader: View {
    var body: some View {
        Image("yycfood")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct yycHeader_Previews: PreviewProvider {
    static var previews: some View {
        yycHeader()
    }
}
