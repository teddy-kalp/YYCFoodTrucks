//
//  Favorites.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import SwiftUI

struct Favorites: View {
    @ObservedObject var favoriteRepo = FavoriteRespository();
    @ObservedObject var truckRepo = TruckRespository();
    var schedules: [Schedule]
    var locations: [Location]
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    if favoriteRepo.favorites.count > 0{
                        ForEach(favoriteRepo.favorites){ favorite in
                            favoriteTruckLogo(favorite: favorite, trucks: self.truckRepo.trucks, schedules: self.schedules, locations: self.locations)
                        }
                    }
                     else {
                        VStack(alignment: .center){
                            Spacer()
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("No Favorites Yet!")
                             .font(.title)
                            
                            Text("Lets change that, click on Discover to begin finding your favorite trucks")
                            .font(.headline)
                            .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                        }
                    }
                }
            }.navigationBarTitle("Favorites", displayMode: .inline)
            .font(.title)
        }
    }
}

struct favoriteTruckLogo: View{
    var favorite: Favorite
    var trucks: [Truck]
    var schedules: [Schedule]
    var locations: [Location]
    
    var body: some View{
        return
            ForEach(trucks){ truck in
                Group{
                    if self.favorite.truck_id == truck.id{
                        HStack{
                            NavigationLink(destination: TruckProfile(truck: truck, schedules: schedules, locations: locations)){
                            FirebaseImage(id:(truck.logo), width: Int(UIScreen.main.bounds.width/4), height: 175/2)
                            VStack{
                                Text(truck.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 24))
                                if (truck.open){
                                    Text("Open Now")
                                    .font(.system(size: 18))
                                    .foregroundColor(primColor)
                                }
                                else{
                                    Text("Closed Now")
                                    .font(.system(size: 18))
                                    .foregroundColor(.red)
                                }
                            }
                            .frame(width: 200, height: 200, alignment: .center)
                        }
                    }
                    .frame(width: 400, height: 200)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
            }
        
        }
    }
}
/*
struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites(schedules: testSchedules, locations: testLocations)
    }
}
*/
