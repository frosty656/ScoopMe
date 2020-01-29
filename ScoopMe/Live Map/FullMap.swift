//
//  FullMap.swift
//  ScoopMe
//
//  Created by Jacob Frost on 1/27/20.
//  Copyright © 2020 Jacob Frost. All rights reserved.
//

import SwiftUI
import MapKit

struct FullMap: View {
    @State private var showCancelButton: Bool = false
    @State private var showSearch: Bool = false
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    @State var searchText = ""
    var body: some View {
        ZStack(){
            VStack(){
                LiveMapView()
            }
            
            VStack(){
                
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                            self.showSearch = true
                        }, onCommit: {
                            print("onCommit")
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
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
                 if showSearch {
                     List {
                         // Filtered list of names
                         ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                             searchText in Text(searchText)
                         }
                     }
                     .navigationBarTitle(Text("Search"))
                    .cornerRadius(10.0)
                     //.resignKeyboardOnDragGesture()
                 }
                Spacer()
            }.padding()
        }
    }
}

struct FullMap_Previews: PreviewProvider {
    static var previews: some View {
        FullMap()
    }
}
