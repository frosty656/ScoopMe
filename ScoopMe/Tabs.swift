//
//  TabbedView.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct Tabs : View {
    var body: some View {

       TabView {
            ViewCurrentRides()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            LocationView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Locations")
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
        Tabs()
    }
}
