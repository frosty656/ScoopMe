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
    var location: LocationData
    
    var body: some View {
        NavigationView{
            VStack(){
                MapView(
                    latitude: location.latitude,
                    longitude: location.longitude)
                    .frame(height: 250)
                    .padding()
                Text("\(location.name)")
                    .font(.system(size: 50))
                    .offset(y: -35)
                    .padding(.bottom, -45)
                
                HStack(){
                    Text("\(location.distance, specifier: "%.2f") mi")
                    //Text("Distance \(location.distance)")
                        .font(.system(size: 30))
                    Spacer()
                }
                Spacer()
                HStack(){
                    Button(action: {
                            
                        }) {
                        Text("  Watch  ")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.blue, lineWidth: 3)
                        )
                    }
                    Spacer()
                    Button(action: {
                        NewRideDeclaration(
                            location: self.location.id,
                            amountOfRiders: 5
                        )
                    }) {
                        Text("Drive To")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.blue, lineWidth: 3)
                        )
                    }
                }.padding()
                
                Spacer()
            }
        }
    }
}

struct LocationDetails_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetails(location: LocationData(id: "Temp", name: "Target", longitude: 3, latitude: -71.460710, distance: 43.045370))
    }
}
