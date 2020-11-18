//
//  Events.swift
//  YYCFoodTrucks
//
//  Created by Bojana on 2020-10-27.
//

import SwiftUI

struct Events: View {

    @ObservedObject var eventRepo = EventRespository();
    @ObservedObject var eventScheduleRepo = EventScheduleRespository();

    

    var body: some View {
        NavigationView{
              ScrollView{
                GeometryReader{ geo in
                    ForEach(eventRepo.events){ event in
                        VStack(alignment: .leading){
                                FirebaseImage(id:(event.logo), width: Int(UIScreen.main.bounds.width), height: 300)
                                Text(event.name)
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.leading, 5)
                                Spacer()
                                Text("About this Event")
                                    .font(.title)
                                    .padding(.leading, 5)
                                Text(event.description)
                                        //having trouble getting the text to wrap
                                    .font(.body)
                                    .padding(.bottom, 20)
                                    .padding(.leading, 5)
                                Text("Event Schedule")
                                    .font(.title)
                                    .padding(.leading, 5)
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(event.eventDate)
                                            .foregroundColor(primColor)
                                            .font(.system(size: 18))
                                        Text(event.eventTime)
                                            .foregroundColor(primColor)
                                            .font(.system(size: 18))
                                    }
                                    if (event.open){
                                        Text("Open Now")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                            .padding()
                                    }
                                    else{
                                        Text("Not Started")
                                        .foregroundColor(.red)
                                        .font(.system(size: 14))
                                        .padding()
                                    }
                                }
                            }
                        }
                      }
            }.navigationBarTitle("Events", displayMode: .inline)
              .font(.title)
        }
}

struct Events_Previews: PreviewProvider {
    static var previews: some View {
        Events()
    }
}

}


