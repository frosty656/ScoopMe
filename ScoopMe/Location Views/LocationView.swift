//
//  LocationView.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/22/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var locationList = getLocations()
    var body: some View {
        NavigationView{
            List{
                ForEach(locationList.data) { i in
                    HStack{
                        Text(i.name)
                            .frame(width: 150)
                            .font(.system(size: 32))

                        Spacer()

                        MapView(latitude: i.latitude, longitude: i.longitude)
                            .frame(width: 50, height: 50)

                        //Text("\(i.distance, specifier: "%.2f") mi")
                        Text("\(i.distance)mi")
                        
                        NavigationLink(destination: LocationDetails(location: i)){
                            Text("")
                        }
                    }
                }
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
