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
            Text("\("Leaving".localized): \(formatDate(dateToFormat: ride.leaveTime))")
            Text("\("Driver".localized): " + (ride.driver["Name"] ?? ""))
            Text("\("From".localized): " + ride.locationName + " to " + ride.destinationName)
            Text("\("Seats".localized): \(ride.seats)")
            Text("\("Passengers".localized):")
            
            List{
                ForEach(ride.riders, id: \.self){ i in
                    VStack(){
                        Text("\(i["riderName"] ?? "")")
                        NavigationLink(destination: RiderProfile(ride: i)){Text("")}
                    }
                }
            }   
            
            Button("Join"){
                joinRide(ride: self.ride)
                    
            }.buttonStyle(NormalButton())
        }.padding()
        
    }
}
