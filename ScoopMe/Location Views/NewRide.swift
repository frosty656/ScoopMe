//
//  NewRide.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/11/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import Firebase

struct NewRide: View {
    
    var location: LocationData
    
    @State private var selectedDate = Date()
    @State private var seats = 4
    @State private var selectionDestination = 4
    @State var locationList = ["Arena","Gym","Lincoln","Conway","Hampton","Windsor","Tuckerman","Manadnock","26-C","Library","Gustafson Center","Belknap Hall","Robert Frost","Dining Hall","ACC","Hospitality","Student Center","Green Center","Exeter Hall","Stark Hall","Washingtin","New Castle","Larkin Field","Webster Hall","Ceta Annex","Ceta Building","Baseball Field","Softball Field","Kingston","Rockingham"]
    

    var body: some View {
        NavigationView{
            VStack(){
                
                Text("Where are you leaving from?")
                Picker(selection: $selectionDestination, label: Text("")){
                    ForEach(0 ..< locationList.count){
                        Text(self.locationList[$0]).tag($0)
                    }
                }.labelsHidden()
                Text("Enter the time you are leaving")
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .hourAndMinute
                ).labelsHidden()
                
                HStack(){
                    Text("Avaiable Seats: ")

                    Button("-"){
                        if self.seats > 1 {
                            self.seats -= 1
                        }
                    }

                    Text("\(self.seats)")

                    Button("+"){
                        self.seats += 1
                    }
                }

                 Text("") //spacer
                
                
                Button("Drive Here") {
                    NewRideDeclaration(ride: Ride(
                    id: "",
                    driver: ["ID":"","Name":""], //Leave Blank
                    riders: [["":""]],
                    seats: self.seats,
                    location: self.locationList[self.selectionDestination],
                    destination: self.location.name,
                    leaveTime: self.selectedDate
                    ))
                }
                    
            }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NewRide_Previews: PreviewProvider {
    static var previews: some View {
        NewRide(location: LocationData(id: "Temp", name: "Target", longitude: 3, latitude: -71.460710))
    }
}
