//
//  OperatorLogin.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-22.
//

import SwiftUI

struct OperatorLogin: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Operator Login")
                .frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(Color.gray)
            }
        }
    }
}

struct OperatorLogin_Previews: PreviewProvider {
    static var previews: some View {
        OperatorLogin()
    }
}
