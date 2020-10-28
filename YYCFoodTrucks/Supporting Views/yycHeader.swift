//
//  yycHeader.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct yycHeader: View {
    @EnvironmentObject var router: Router
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: {self.router.cur_page = "HomePage"}){
        Image("yycfood")
            .resizable()
            .frame(width: 80, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(.black)
    }
}

struct yycHeader_Previews: PreviewProvider {
    static var previews: some View {
        yycHeader()
    }
}
