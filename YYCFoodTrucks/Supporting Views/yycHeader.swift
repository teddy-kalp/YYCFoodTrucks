//
//  yycHeader.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-16.
//

import SwiftUI

struct yycHeader: View {
    @EnvironmentObject var router: Router
    var body: some View {
        HStack{
            Button(action: {self.router.cur_page = "HomePage"}){
            Image("yycfood")
                .resizable()
                .frame(width: 80, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(.black)
            .offset(x: 60)
            Button(action: {self.router.cur_page = "OperatorLogin"}){
                VStack{
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Operator Login")
                    }
                .foregroundColor(.black)
            }
            .offset(x: 100)
        }
    }
}

struct yycHeader_Previews: PreviewProvider {
    static var previews: some View {
        yycHeader()
    }
}
