//
//  CreateDriver.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/5/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct CreateDriver: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var car: String = ""
    @State var licencePlate: String = ""
    @State var color: String = ""
    @State var isShowing = true // toggle state
    @State var errorMessage = ""
    
    var body: some View {
//        NavigationView{
            VStack{
                Text("Type of Car")
                TextField("Ford Escape", text: $car)
                
                Text("Car Color")
                TextField("Blue", text: $color)
                
                Text("Licence Plate")
                TextField("ABC123", text: $licencePlate)
                
                Toggle("I live on campus", isOn: $isShowing)
                
                //On success go to homepage
                Button(action: {
                    var success = true
                    CreateDriverDetails(licencePlate: self.licencePlate, car: self.car, color: self.color){
                        err in
                        self.errorMessage = err!
                        success = false
                        print("Driver Details Failed")
                    }
                    
                    if(success){
                        print("Going to tabs")
                        self.viewRouter.currentPage = "Tabs"
                    }
                    
                }) {
                    Text("Become Driver")
                }
                
            }.padding()
        }
 //   }
}

struct CreateDriver_Previews: PreviewProvider {
    static var previews: some View {
        CreateDriver()
    }
}
