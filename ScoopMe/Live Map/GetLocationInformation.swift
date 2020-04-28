import SwiftUI
import MapKit


struct mapViewSearchresults :  UIViewRepresentable {
    @Binding var locations: [MKMapItem]
    @Binding var showDetails: Int?
    @Binding var choiceIndex: Int
    
    let map = MKMapView()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<mapViewSearchresults>) -> MKMapView {
        
        let userLocation = usersLocation().currentLocation

        let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 25000, longitudinalMeters: 25000)
        map.region = region
        map.delegate = context.coordinator
    
        return map
    }

    //This should have logic to only remove unnecessary ones and add new ones
    //Do NOT touch ones that stay the same. No reason to redraw
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapViewSearchresults>) {
        
        if locations.count < 1 {
            let allAnnotations = uiView.annotations
            
            uiView.removeAnnotations(allAnnotations)
        }

        if locations.count > 0{
            
            for i in 0...locations.count - 1{
                //Check if item already exists
                
                let alreadyExists = uiView.annotations.first(where: {$0.coordinate.longitude == locations[i].placemark.coordinate.longitude && $0.coordinate.latitude == locations[i].placemark.coordinate.latitude})
                
                if alreadyExists == nil{
                    let location = MKPointAnnotation()
                      
                    var title = locations[i].placemark.title?.components(separatedBy: ",")[1] ?? " N/A"
                    
                    title.removeFirst()
                    
                    location.title = title
                    
                    location.coordinate = locations[i].placemark.coordinate
                    
                    uiView.addAnnotation(location)
                }
            }
        }
    }

    class Coordinator : NSObject, MKMapViewDelegate{
        var parent: mapViewSearchresults
        
        init(_ parent: mapViewSearchresults){
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {  
            for i in Range(0 ... parent.locations.count - 1){
                if((parent.locations[i].name?.contains(view.annotation!.title as! String)) != nil){
                    parent.choiceIndex = i
                    parent.showDetails = 1
                }
            }
        
        }
    }
}

/*

struct searchForLocations {
    @Binding var locationToSearchFor: String
    @Binding var listOfLocations: [MKMapItem]
    
    func search() {

    }
}

*/
