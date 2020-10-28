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
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    if favoriteRepo.favorites.count > 0{
                        ForEach(favoriteRepo.favorites){ favorite in
                            HStack{
                                ForEach(self.truckRepo.trucks){ truck in
                                    if favorite.truck_id == truck.id{
                                        NavigationLink(destination: TruckProfile(truck: truck)){
                                            URLImage(url: truck.img)
                                        }
                                    }
                                }
                                
                            }.frame(width: 400, height: 250)
                                .padding(20)
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

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
