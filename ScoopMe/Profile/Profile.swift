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
    @EnvironmentObject var viewRouter: ViewRouter
    
    
    var body: some View {
        VStack  (){
            ProfilePicture()
                
                .frame(width: 300, height: 150)
                .offset(x: -100, y: 0)
            HStack(){
                
                VStack(){
                    
                    Text((userInfo.user.firstName) + " " + (userInfo.user.lastName))
                    Text(userInfo.user.dorm)
                }
                Spacer()
            }
            .font(.system(size: 24))
            
//            Button(action:{
//                self.viewRouter.currentPage = "Login"
//
//                    print("Logged out")
//
//
//            }, label: {
//                Text("Log Out")
//            })
            
        }.padding()
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
        
    }
}
