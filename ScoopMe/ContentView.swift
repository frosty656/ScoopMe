//
//  Testing.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/16/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import MapKit

struct Locations: Hashable {
    let name: String
    let distance: Int
    let longitude: Double
    let latitude: Double
    
//  let location: CLLocationCoordinate2D
}

struct ContentView: View {
    
    var locationList = [
        Locations(name: "Target", distance: 3, longitude: -71.460710, latitude: 43.045370),
        Locations(name: "Walmart", distance: 4, longitude: -71.474460, latitude: 43.040800)
        
    ]
    
    
var body: some View {
    
    HStack(){
        NavigationView{
            List(locationList, id: \.name) { place in
                HStack(spacing: 20) {
                    Text(place.name)
                        .frame(width: 150)
                    
                    Spacer()
                    
                    Text("\(place.distance) mi")
                    
                    NavigationLink(destination: LocationDetails(location: place)){
                        Text("")
                    }
                    
                    }.padding(4)
                    
              }.navigationBarTitle(Text("Rides"))
                .font(.system(size: 24))

            }
        
        
        }
    }
}


struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
