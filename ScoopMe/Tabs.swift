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
            Text("The First Tab")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Locations")
                }
        Profile(info:CurrentUser.currentuser)
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