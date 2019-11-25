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
    
    //Picker limits
    var body: some View {
        NavigationView{
            VStack(){
                Text("Enter the time you are leaving")
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .hourAndMinute
                )
                
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
                    driver: ["ID":Auth.auth().currentUser!.uid,"Name":"NAME GOES HERE"],
                    riders: [["":""]],
                    seats: self.seats,
                    location: self.location.name,
                    leaveTime: self.selectedDate
                    ))
                }
                
                Spacer()
            }
        }
    }
}

struct NewRide_Previews: PreviewProvider {
    static var previews: some View {
        NewRide(location: LocationData(id: "Temp", name: "Target", longitude: 3, latitude: -71.460710, distance: 43.045370))
    }
}
