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
                        Text("\(i.locationName)\n -> \(i.destinationName)")
                            
                        Text(" \("Leaving".localized): \(self.getHours(date: i.leaveTime))")
                        
                        NavigationLink(destination: RideDetails(ride: i)){
                            Text("")
                        }.frame(width: 10, height: 10)
                    }
                }.onDelete(perform: deleteItems)
            }.navigationBarTitle("\("Rides".localized):")
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
