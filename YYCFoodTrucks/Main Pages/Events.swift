//
//  Events.swift
//  YYCFoodTrucks
//
//  Created by Bojana on 2020-10-27.
//

import SwiftUI

struct Events: View {

    var events: [Event]

    

    var body: some View {
        NavigationView(){
            VStack(){
                  ScrollView{
                        ForEach(events){ event in
                            VStack(alignment: .leading){
                                VStack(){
                                  
                                    FirebaseImage(id:(event.logo), width: Int(UIScreen.main.bounds.width), height: 300)
                                    EventDetails(event: event)
                                    EventScheduleDetails(event: event)
                                        //.padding(.bottom, 30)
                                        
                                  }
                               } .frame(alignment: .center)
                            .padding(.bottom,30)
                            .padding(.top,30)
                            }
                         }
                }.navigationBarTitle("Events", displayMode: .inline)
                  .font(.title)
            }
         }
    
    
    
struct EventDetails: View {
    var event: Event
    
    var body: some View {
        Text(event.name)
            .foregroundColor(.black)
            .font(.title)
            .fontWeight(.bold)
            .padding(.leading, 5)
        Spacer()
        Text("About this Event")
            .font(.title)
            .padding(.leading, 5)
            .padding(.bottom, 10)
        Text(event.description)
                        //having trouble getting the text to wrap
            .font(.body)
            .padding(.leading, 5)
        Text("Event Schedule")
            .font(.title)
            .padding(.leading, 5)
            .padding()
            }
        }
    }


struct EventScheduleDetails: View {
    var event: Event
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(event.location)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
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


