//
//  EventList.swift
//  YYCFoodTrucks
//
//  Created by Bojana on 2020-11-09.
//

import SwiftUI

struct EventList: View {
    var locations: [Location]
    var schedules: [EventSchedule]
    var events: [Event]

    
    var body: some View {
        ScrollView{
            ForEach(events){ Event in
                    HStack{
                        FirebaseImage(id:(Event.logo), width: Int(UIScreen.main.bounds.width/4), height: 175/2)
                        VStack{
                            Text(Event.name)
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                            if (Event.open){
                                Text("Open Now")
                                .foregroundColor(primColor)
                            }
                            else{
                                Text("Not Started")
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
