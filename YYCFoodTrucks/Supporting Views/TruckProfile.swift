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
            HStack(alignment: .top){
                VStack(alignment: .leading){
                FirebaseImage(id: "FreshlySqueezedBanner1.jpg", width: Int(UIScreen.main.bounds.width), height: 300)
                
                Group{
                    truckNameView
                    /*Text(self.truck.address)
                        .font(.subheading)*/
                    currentLocationView
                
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
    
    var truckNameView: some View{
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
        }
    }
    
    var currentLocationView: some View{
        Group{
            Text("2500 University Avenue, Calgary, AB T2N1N4")
             .font(.subheadline)
                .foregroundColor(Color.gray)
             Text("2PM - 6PM")
                .font(.subheadline)
                .padding(.bottom, 20)
                .foregroundColor(Color.gray)
        }
    }
    var menuView: some View {
     return  URLImage(url: self.truck.menu, resizable: true)
        .frame(width: UIScreen.main.bounds.width, height: 500)
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
