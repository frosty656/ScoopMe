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
    //Should query database for this information
    @ObservedObject var userInfo = getCurrentUserInformation()
    
    
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
            
            Button(action:{
                do{
                    try Auth.auth().signOut()
                } catch {
                    
                }
                
            }, label: {
                Text("Log Out")
            })
            
//            List(){
//                Text("Target")
//                Text("Walmart")
//
//            }
//        .navigationBarTitle(Text("Previous rides"))
//            .font(.system(size: 24))
        
            
        }.padding()
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
        
    }
}
