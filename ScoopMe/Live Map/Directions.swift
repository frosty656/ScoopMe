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
    @State var distance: CLLocationDistance = CLLocationDistance(exactly: 0.0)!
    var body: some View {
        ZStack(){
            routeMapView(distance: $distance)
            
            if distance != 0{
                VStack(){
                    Button("Click Me"){
                        searchForLocation()
                    }
                    Spacer()
                    
                    Text("\(String(format: "Distance: %.2f", (distance / 1000) * 0.6213712)) mi")
                }
            }
        }
    }
}

func searchForLocation(){
    let searchRequest = MKLocalSearch.Request()
    searchRequest.naturalLanguageQuery = "Target"
    let sourceCoordinate = CLLocationCoordinate2D(latitude: 43.038261, longitude: -71.453781)
    
    searchRequest.region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
    let search = MKLocalSearch(request: searchRequest)
    search.start { response, error in
        guard let response = response else {
            print("Error: \(error?.localizedDescription ?? "Unknown error").")
            return
        }

        for item in response.mapItems {
            print("\(item.placemark.title ?? "Well shit")")
        }
    }
}

struct Directions_Previews: PreviewProvider {
    static var previews: some View {
        Directions()
    }
}


struct routeMapView :  UIViewRepresentable {
    @Binding var distance: CLLocationDistance
    
    func makeCoordinator() -> routeMapView.Coordinator {
        return  routeMapView.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<routeMapView>) -> MKMapView {
        let map = MKMapView()
        
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 43.038261, longitude: -71.453781)
        
        let destination = CLLocationCoordinate2D(latitude: 43.045368, longitude: -71.460709)
        
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
            self.distance = direct?.routes.first?.distance ?? CLLocationDistance(exactly: 0.0)!
            let polyline = direct?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
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
