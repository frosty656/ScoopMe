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
     @State var showLocationDetails = false
    var body: some View {
        NavigationView{
            List{
                ForEach(locationList.data) { i in
                    HStack{
                        Text(i.name)
                            .frame(width: 150)
                            .font(.system(size: 24))

                        Spacer()
                        
                        Button(action: {self.showLocationDetails.toggle()}){
                            Text("")
                            
                        }.sheet(isPresented: self.$showLocationDetails, content: {LocationDetails(location: i)})
                    }
                }
            }
            .navigationBarTitle("Locations")
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
