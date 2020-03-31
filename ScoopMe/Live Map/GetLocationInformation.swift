import SwiftUI
import MapKit

struct mapViewSearchresults :  UIViewRepresentable {
    @Binding var locations: [MKMapItem]
    let map = MKMapView()
    

    func makeCoordinator() -> mapViewSearchresults.Coordinator {
        return  mapViewSearchresults.Coordinator()
    }

    func makeUIView(context: UIViewRepresentableContext<mapViewSearchresults>) -> MKMapView {
        
        let userLocation = usersLocation().currentLocation

        let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 25000, longitudinalMeters: 25000)
        map.region = region
        map.delegate = context.coordinator
    
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapViewSearchresults>) {
        
        let allAnnotations = uiView.annotations
        uiView.removeAnnotations(allAnnotations)
        
        if locations.count > 0{
            
            for i in 0...locations.count - 1{
                let location = MKPointAnnotation()
                
                location.title = locations[i].placemark.title?.components(separatedBy: ",")[1] ?? "N/A"
                
                location.coordinate = locations[i].placemark.coordinate
                
                uiView.addAnnotation(location)
            }
        }
        

        

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


struct searchForLocations {
    @Binding var locationToSearchFor: String
    @Binding var listOfLocations: [MKMapItem]
    
    func search() {

    }
}

