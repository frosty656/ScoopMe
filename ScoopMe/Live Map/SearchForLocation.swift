//
//  SearchForLocation.swift
//  ScoopMe
//
//  Created by Jacob Frost on 2/2/20.
//  Copyright © 2020 Jacob Frost. All rights reserved.
//

import SwiftUI
import MapKit

struct SearchForLocation: View {
        @State private var showCancelButton: Bool = false
        @State private var showSearch: Bool = false
        @State var searchText = ""
        @State var searchResults = [MKMapItem]()
       
        var body: some View {
           NavigationView{
               ZStack(){
                   LiveMapView()
                   VStack(){
                       HStack {
                           HStack {
                               Image(systemName: "magnifyingglass")

                               TextField("search", text: $searchText, onEditingChanged: { isEditing in
                                   self.showCancelButton = true
                                   self.showSearch = true
                               }, onCommit: {
                                   print("onCommit")
                                   self.doSearch()
                               }).foregroundColor(.primary)

                               Button(action: {
                                   self.searchText = ""
                               }) {
                                   Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                               }
                           }
                           .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                           .foregroundColor(.secondary)
                           .background(Color(.secondarySystemBackground))
                           .cornerRadius(10.0)

                           if showCancelButton  {
                               Button("Cancel") {
                                   UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                                   self.searchText = ""
                                   self.showCancelButton = false
                                   self.showSearch = false
                                self.searchResults.removeAll()
                               }
                               .foregroundColor(Color(.systemBlue))
                           }
                       }
                       .padding(.horizontal)
                       .navigationBarHidden(showCancelButton)
                        if showSearch {
                            List {
                               ForEach(searchResults, id:\.self) {
                                   loc in
                                   
                                    HStack(){
                                        VStack(){
                                            HStack(){
                                                Text("\(loc.name ?? "No name")")
                                                Spacer()
                                            }
                                            HStack(){
                                                Text("\(loc.placemark.title?.components(separatedBy: ",")[0] ?? "N/A"),")
                                                Text("\(loc.placemark.title?.components(separatedBy: ",")[1] ?? "N/A")")
                                                Spacer()
                                            }.font(.body)
                                        }
                                            
                                        NavigationLink("", destination: Directions(location: loc)).frame(width: 20, height: 20, alignment: .leading)
                                    }
                                }
                            }
                           .cornerRadius(10.0)
                        }
                       Spacer()
                   }.padding()
               }
                
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            }
       }
       
       func doSearch() {
           let searchRequest = MKLocalSearch.Request()
           searchRequest.naturalLanguageQuery = searchText
           let userLocation = usersLocation()

           searchRequest.region = MKCoordinateRegion(center: userLocation.currentLocation, latitudinalMeters: 100000, longitudinalMeters: 100000)
           let search = MKLocalSearch(request: searchRequest)
           search.start { response, error in
               guard let response = response else {
                   print("Error: \(error?.localizedDescription ?? "Unknown error").")
                    
                   return
               }

            self.searchResults.removeAll()
            
               for item in response.mapItems {
                   self.searchResults.append(item)
                
               }
           }
       }
}

struct SearchForLocation_Previews: PreviewProvider {
    static var previews: some View {
        SearchForLocation()
    }
}
