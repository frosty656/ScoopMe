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
            Text("Name: " + (ride.driver["Name"] ?? ""))
            Text("From: " + ride.location + " to " + ride.destination)
            Text("Seats: \(ride.seats)")
            Text("Passengers: ")
            
            List{
                ForEach(ride.riders, id: \.self){ i in
                    VStack(){
                        Text("\(i["RiderName"] ?? "")")
                        NavigationLink(destination: RiderProfile(ride: i)){Text("")}
                        
                    }
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
                driver: ["Name": "Jacob", "ID": "WOOAAHHHID"],
                riders: [["Person1ID": "Person1ID", "Person1Name": "Person1Name"], ["Person2": "Person2", "Person2Name": "Person2Name"], ["Person3": "Person3", "Person3Name": "Person3Name"]],
                seats: 4,
                location: "Target",
                destination: "Walmart",
                leaveTime: NSDate() as Date)
        )
    }
}
