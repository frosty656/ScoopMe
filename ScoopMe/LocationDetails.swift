//
//  LocationDetails.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import MapKit

struct LocationDetails: View {
    var location: Locations
    var body: some View {
        VStack(){
            MapView(coordinate: CLLocationCoordinate2D(
                latitude: location.latitude, longitude: location.longitude))
                .frame(height: 250)
                .padding()
            Text("\(location.name)")
                .font(.system(size: 50))
                .offset(y: -35)
                .padding(.bottom, -45)
            
            HStack(){
                Text("Distance: \(location.distance) mi")
                    .font(.system(size: 30))
                Spacer()
            }
            Spacer()
            Button(action: {}) {
                Text("Watch Location")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 5)
                )
            }
                Spacer()
            
            
        }
    }
}

struct LocationDetails_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetails(location: Locations(name: "Target", distance: 3, longitude: -71.460710, latitude: 43.045370))
    }
}
