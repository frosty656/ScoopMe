//
//  RideDetails.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/4/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct RideDetails: View {
    var ride: Ride
    var body: some View {
        VStack(){
            Text("Name: " + ride.driver)
            Text("Location: " + ride.location)
            Text("Seats: \(ride.seats)")
            
            
            Text("Passengers: ")
            ForEach(ride.riders, id: \.self){ i in
                VStack(){
                    Text(i)
                }
            }
            
            Button(action: {
                joinRide(ride: self.ride)
                }) {
                Text("  Join  ")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .padding(2)
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 3)
                )
            }
           
        }
        
    }
}

struct RideDetails_Previews: PreviewProvider {
    static var previews: some View {
        RideDetails(
            ride: Ride(
                id: "312312312312",
                driver: "Jacob",
                riders: ["Person1", "Person2", "Person3"],
                seats: 4,
                location: "Target")
        )
    }
}
