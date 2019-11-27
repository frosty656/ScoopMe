//
//  ViewCurrentRides.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/4/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct ViewCurrentRides: View {
    @ObservedObject var rideList = getCurrentRides()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(rideList.data) { i in
                    HStack{
                        Text(i.location)
                        
                        
                            Text("Driver: " + (i.driver["Name"] ?? ""))
                            
                            
                            Text("Leaving: \(self.getHours(date: i.leaveTime))")
                        
                        NavigationLink(destination: RideDetails(ride: i)){
                            Text("")
                        }
                    }
                }
            }.navigationBarTitle("Rides: ")
        }
    }
    
    func getHours(date: Date) -> String{
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "HH:mm"
        
        return (formatter1.string(from: date))
    }
}

struct ViewCurrentRides_Previews: PreviewProvider {
    static var previews: some View {
        ViewCurrentRides()
    }
}
