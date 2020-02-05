//
//  Directions.swift
//  ScoopMe
//
//  Created by Jacob Frost on 1/28/20.
//  Copyright © 2020 Jacob Frost. All rights reserved.
//

import SwiftUI
import MapKit

struct Directions: View {
    @State var location: MKMapItem
    @State var isUp = false
    @State var distance: Double = 0
    var body: some View {
        VStack(){
            routeMapView(location: location, distance: $distance)
                .frame(maxHeight: 400)
           
            Text("\(location.name ?? "Name not found")")
                .font(.largeTitle)
            Text("\(location.placemark.title ?? "")")
                .font(.subheadline)
            Text("Distance: \((distance / 1000)*0.6213712, specifier: "%.2f")mi")
            Spacer()
            
            Button("Drive Here"){
                self.isUp = true
            }
        .padding(40)
            
            }.sheet(isPresented: self.$isUp, content: {DeclareRideView(locationDetails: self.location)})
    }
}

struct routeMapView :  UIViewRepresentable {
    
    @State var location: MKMapItem
    
    @Binding var distance: Double

    func makeCoordinator() -> routeMapView.Coordinator {
        return  routeMapView.Coordinator()
    }

    func makeUIView(context: UIViewRepresentableContext<routeMapView>) -> MKMapView {
        let map = MKMapView()

        let sourceCoordinate = usersLocation().currentLocation

        let destination = location.placemark.coordinate

        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = sourceCoordinate
        sourcePin.title = "Start"
        map.addAnnotation(sourcePin)

        let destinationPin = MKPointAnnotation()
        destinationPin.coordinate = destination
        destinationPin.title = "End"
        map.addAnnotation(destinationPin)

        let region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
        map.region = region
        map.delegate = context.coordinator

        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))

        let directions = MKDirections(request: req)

        directions.calculate {
            (direct, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            let polyline = direct?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
            
            self.distance = direct?.routes.first?.distance as! Double
        }
    
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<routeMapView>) {
    }

    class Coordinator : NSObject, MKMapViewDelegate{
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) ->
            MKOverlayRenderer {
                let render = MKPolylineRenderer(overlay: overlay)
                render.strokeColor = .red
                render.lineWidth = 4
                return render
            }
    }

}
