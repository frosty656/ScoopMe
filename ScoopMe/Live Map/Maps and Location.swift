//
//  Maps and Location.swift
//  ScoopMe
//
//  Created by Jacob Frost on 1/29/20.
//  Copyright © 2020 Jacob Frost. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI
import CoreLocation
import Combine

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        self.geocode()
    }
}

class LocationManager: NSObject, ObservableObject {
  private let locationManager = CLLocationManager()
  let objectWillChange = PassthroughSubject<Void, Never>()

  @Published var status: CLAuthorizationStatus? {
    willSet { objectWillChange.send() }
  }

  @Published var location: CLLocation? {
    willSet { objectWillChange.send() }
  }

  override init() {
    super.init()

    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
  }

    private let geocoder = CLGeocoder()
  
  // Rest of the class

  @Published var placemark: CLPlacemark? {
    willSet { objectWillChange.send() }
  }

  private func geocode() {
    guard let location = self.location else { return }
    geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
      if error == nil {
        self.placemark = places?[0]
      } else {
        self.placemark = nil
      }
    })
  }
}

class usersLocation : ObservableObject {
    @Published var currentLocation: CLLocationCoordinate2D
    let locationManager = CLLocationManager()
    init(){
        let status = CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            currentLocation = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
        } else {
            currentLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
    }
}

//class usersLocation123 : ObservableObject {
//    @Published var currentLocation: CLLocationCoordinate2D
//    let locationManager = CLLocationManager()
//    init(){
//        let status = CLLocationManager.authorizationStatus()
//        locationManager.requestAlwaysAuthorization()
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//
//        if status == .authorizedAlways || status == .authorizedWhenInUse {
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//            currentLocation = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
//        } else {
//            currentLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
//        }
//    }
//}

