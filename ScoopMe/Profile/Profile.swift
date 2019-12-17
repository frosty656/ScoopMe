//
//  Profile.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import Firebase
struct Profile: View {
    //This needs to change to only run once
    @ObservedObject var userInfo: getCurrentUserInformation
    @State private var showSettings = false
    @EnvironmentObject var viewRouter: ViewRouter
    
    init(){
        userInfo = getCurrentUserInformation(){
            error in
            print(error!)
        }
    }
    
    var body: some View {
        NavigationView{

            VStack(){

                ProfilePicture()
                        .frame(width: 300, height: 150)
                    
                    HStack(){
                        
                        VStack(){
                            
                            Text((userInfo.user.firstName) + " " + (userInfo.user.lastName))
                                
                            Text(userInfo.user.dorm)
                        }
                    }
                    .font(.system(size: 24))
                    Spacer()
                }.padding()



        
        
        .padding()
        .navigationBarTitle("Profile")
        .navigationBarItems(trailing:
            Button(action: {
                self.showSettings.toggle()
            }){
                Image("icons8-ios-50")
                .resizable()
                .frame(width: 32.0, height: 32.0)
                .padding()
            }.sheet(isPresented: $showSettings)
            {SettingsView().environmentObject(self.viewRouter)})
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
        
    }
}
