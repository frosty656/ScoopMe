//
//  TabbedView.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import MapKit

struct Tabs : View {
    @EnvironmentObject var viewRouter: ViewRouter
    let locationManager = CLLocationManager()
    
    init(){
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }
    
    var body: some View {
       TabView {
            ViewCurrentRides()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchForLocation()
                .tabItem {
                    Image(systemName: "map")
                    Text("MapView")
                }
            Profile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .font(.headline)
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        Tabs().environmentObject(ViewRouter())
    }
}
