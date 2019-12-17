//
//  LocationPicker.swift
//  ScoopMe
//
//  Created by Jacob Frost on 12/11/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct LocationPicker: View {
    @Environment(\.presentationMode) var pickerVisible
    @State var errormessage = ""
    @Binding var location: String
    @State private var selectionDestination = 1
    @State var locationList = ["Lincoln","Conway","Hampton","Windsor","Tuckerman","Manadnock","Library","Washingtin","New Castle","Kingston","Rockingham"]
    
    var body: some View {
        VStack(){
            Text("Where are you leaving from?")
            Picker(selection: $selectionDestination, label: Text("")){
                ForEach(0 ..< locationList.count){
                    Text(self.locationList[$0]).tag($0)
                }
            }.labelsHidden()

            Button("Select"){
                self.location = self.locationList[self.selectionDestination]
                self.pickerVisible.wrappedValue.dismiss()
                
            }
            
            Button("I am a commuter"){
                self.location = "Commuter"
                self.pickerVisible.wrappedValue.dismiss()
            }
        }
    }
}

//struct LocationPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationPicker(location: Binding<"">)
//    }
//}
