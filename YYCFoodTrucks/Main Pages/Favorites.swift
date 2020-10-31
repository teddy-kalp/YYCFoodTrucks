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
    var locations: [LandMark]
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    if favoriteRepo.favorites.count > 0{
                        ForEach(favoriteRepo.favorites){ favorite in
                            favoriteTruckLogo(favorite: favorite, truckRepo: self.truckRepo, schedules: self.schedules, locations: self.locations)
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
    @ObservedObject var truckRepo = TruckRespository();
    var schedules: [Schedule]
    var locations: [LandMark]
    
    var body: some View{
        return
            ForEach(self.truckRepo.trucks){ truck in
                Group{
                    if self.favorite.truck_id == truck.id{
                        NavigationLink(destination: TruckProfile(truck: truck, schedules: self.schedules, locations: self.locations)){
                            FirebaseImage(id: truck.logo, width: Int(UIScreen.main.bounds.width), height: 300)
                            Spacer()
                        }
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
