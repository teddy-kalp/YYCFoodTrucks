//
//  TruckProfile.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct TruckProfile: View {
    var truck: Truck
    var body: some View {
        ScrollView{
            HStack{
            VStack(alignment: .leading){
                    URLImage(url: self.truck.img)
                        .frame(width: CGFloat(400), height: 300)
                Group{
                    HStack{
                        Text(self.truck.name)
                            .font(.title)
                            .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: CGFloat(30), height: CGFloat(30))
                        .foregroundColor(.black)
                    }
                    /*Text(self.truck.address)
                        .font(.subheading)*/
                    Group{
                        Text("2500 University Avenue, Calgary, AB T2N1N4")
                            .font(.headline)
                        Text("2PM - 6PM")
                            .font(.headline)
                            .padding(.bottom, 20)
                    }
                
                    Text(self.truck.description)
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 20)
                        
                    Group{
                        //Spacer()
                        Text("Schedule").font(.title)
                        Text("No schedule")
                        .padding(.bottom, 20)
                    }
                    Text("Menu")
                     .font(.title)
                    
                }.padding(.leading, 10)
                .padding(.trailing, 10)
                    Group{
                      //Spacer()
                     menuView
                  }
                
                }
            }.padding(20)
        }
    }
    
    var menuView: some View {
     return  URLImage(url: self.truck.menu, resizable: true)
              .frame(width: UIScreen.main.bounds.width - 5)
              .padding(.bottom, 20)
    }
    
}
/*
struct TruckProfile_Previews: PreviewProvider {
    static var previews: some View {
        TruckProfile(truck: truck)
    }
}
*/
