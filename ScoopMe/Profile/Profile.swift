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
    @ObservedObject var userInfo = getCurrentUserInformation()
    @State var showSettings = false
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationView{
            VStack (){
                if(userInfo.user.firstName.isEmpty || userInfo.user.lastName.isEmpty || userInfo.user.dorm.isEmpty){
                    
                }
                
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
            .navigationBarTitle("Profile")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSettings.toggle()
                }){
                    Image("icons8-ios-50")
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                    .padding()
                }.sheet(isPresented: $showSettings, content: {SettingsView().environmentObject(self.viewRouter)})
            )
        }
    }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
        
    }
}
