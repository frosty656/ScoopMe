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
    @ObservedObject var rideList = getCurrentRides(distance: 10)
    @State var searchTerm = ""
    
    var body: some View {
        NavigationView{
            VStack(){
                TextField("Destination To Search", text: $searchTerm)
                
                List{
                    ForEach(rideList.data.filter({ride -> Bool in
                        if searchTerm.isEmpty {return true}
                        
                        return ride.destinationName.lowercased().contains(searchTerm.lowercased())
                    })) {
                        ride in
                        HStack{
                            Text("\(ride.locationName)\n -> \(ride.destinationName)")
                            
                            Text(" \("Leaving".localized): \(self.getHours(date: ride.leaveTime))")
                            
                            NavigationLink(destination: RideDetails(ride: ride)){
                                Text("")
                            }.frame(width: 10, height: 10)
                        }
                    }
                    
                }
            }.navigationBarTitle("\("Rides".localized):")
                .padding()
        }
    }
    
    func getHours(date: Date) -> String{
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "h:mm a"
        
        return (formatter1.string(from: date))
    }
    
    func deleteItems(at offsets: IndexSet){
        rideList.data.remove(atOffsets: offsets)
    }
}

struct ViewCurrentRides_Previews: PreviewProvider {
    static var previews: some View {
        ViewCurrentRides()
    }
}
