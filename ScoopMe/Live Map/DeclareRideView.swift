//
//  DeclareRideView.swift
//  ScoopMe
//
//  Created by Jacob Frost on 2/3/20.
//  Copyright © 2020 Jacob Frost. All rights reserved.
//

import SwiftUI
import MapKit
import Firebase

struct DeclareRideView: View {
    @State var locationDetails: MKMapItem
    @State private var selectedDate = Date()
    @State private var seats = 3
    @State var leaveFromCurrentLocation = true
    @ObservedObject var lm = LocationManager()
    @Environment(\.presentationMode) var locationsVisible
    var body: some View {
        VStack(){
            Toggle(isOn: $leaveFromCurrentLocation) {
                Text("Leaving From Current Location")
            }.padding()
            
            Text("Leave Time")
            
            DatePicker(
                "",
                selection: $selectedDate,
                displayedComponents: .hourAndMinute
            )
            .labelsHidden()
            
            HStack(){
                Text("Avaiable Seats:")

                Button("-"){
                    if self.seats > 1 {
                        self.seats -= 1
                    }
                }

                Text("\(self.seats)")

                Button("+"){
                    self.seats += 1
                }
            }
            Divider()
            Button("Declare Ride"){
                
                //Check ride time vs current time
                self.declareRide()
                self.locationsVisible.wrappedValue.dismiss()
            }.buttonStyle(NormalButton())
        }
    }
    
    private func declareRide(){
        NewRideDeclaration(ride: Ride(
            id: "",
            driver: ["ID":"", "Name":""],
            riders: [["":""]],
            seats: self.seats,
            locationName: lm.placemark?.name ?? "Name Not Found",
            destinationName: self.locationDetails.name ?? "Name Not Found", //This shit does not work :/
            locationGeoPoint: GeoPoint(
                latitude: usersLocation().currentLocation.latitude,
                longitude: usersLocation().currentLocation.longitude),
            destinationGeoPoint: GeoPoint(
                    latitude: self.locationDetails.placemark.coordinate.latitude,
                    longitude: self.locationDetails.placemark.coordinate.longitude),
            leaveTime: self.selectedDate))
    }
}

//struct DeclareRideView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeclareRideView()
//    }
//}
