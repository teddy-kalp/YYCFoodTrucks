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
                        VStack{
                                FirebaseImage(id: event.logo, width: Int(UIScreen.main.bounds.width) - 20, height: 250).frame(width: UIScreen.main.bounds.width - 20, height: 250, alignment: .center)
                                        .padding()
                                Text(event.name)
                                        .foregroundColor(.black)
                                        .font(.system(size: 24))
                                Text(event.description)
                                        //having trouble getting the text to wrap
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding()
                                       
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
                                
                                .padding()
                            }
                        }
                    
                      }
                        .frame(width: 400, height: 200)
                        
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


