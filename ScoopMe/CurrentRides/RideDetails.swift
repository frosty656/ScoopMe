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
            Text("Leaving at \(ride.leaveTime)")
            Text("Name: " + (ride.driver["Name"] ?? ""))
            Text("From: " + ride.locationName + " to " + ride.destinationName)  
            Text("Seats: \(ride.seats)")
            
            Text("Passengers: ")
            
            List{
                ForEach(ride.riders, id: \.self){ i in
                    VStack(){
                        Text("\(i["riderName"] ?? "")")
                        NavigationLink(destination: RiderProfile(ride: i)){Text("")}
                        
                    }
                }
            }   
            
            Button(action: {
                joinRide(ride: self.ride)
                }) {
                Text("  Join  ")
                .fontWeight(.bold)
                //.font(.system(size: 24))
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
