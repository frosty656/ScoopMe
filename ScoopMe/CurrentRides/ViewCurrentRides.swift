//
//  ViewCurrentRides.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/4/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct ViewCurrentRides: View {
    @ObservedObject var rideList = getCurrentRides()
    var body: some View {
        NavigationView{
            List{
                ForEach(rideList.data) { i in
                    HStack{
                        Text(i.location)
                        Text(i.driver)
                        NavigationLink(destination: RideDetails(ride: i)){
                            Text("")
                        }
                    }
                }
            }
        }
    }
}

struct ViewCurrentRides_Previews: PreviewProvider {
    static var previews: some View {
        ViewCurrentRides()
    }
}
