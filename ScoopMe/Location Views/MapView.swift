/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that hosts an `MKMapView`.
*/

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var latitude: Double
    var longitude: Double

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.0009, longitudeDelta: 0.0009)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: latitude, longitude: longitude), span: span)
        view.setRegion(region, animated: true)
        view.mapType = MKMapType.hybrid
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 43.040800, longitude: -71.474460)
    }
}

