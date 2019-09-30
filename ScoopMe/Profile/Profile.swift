//
//  Profile.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct Profile: View {
    var info: User
    var body: some View {
        VStack(){
            ProfilePicture(image: Image("User"))
                
                .frame(width: 300, height: 150)
                .offset(x: -100, y: 0)
            HStack(){
                
                VStack(){
                
                    Text((info.firstName) + " " + (info.lastName))
                    Text(info.dorm)
                }
                
                Spacer()
                
                VStack(){
                    Text("\(info.car)")
                    Text("\(info.seats)")
                    
                }
            }
            .font(.system(size: 24))
            
            List(){
                Text("Target")
                Text("Walmart")
                
            }
        .navigationBarTitle(Text("Previous rides"))
            .font(.system(size: 24))
        
            
        }.padding()
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(info: CurrentUser.currentuser)
        
    }
}
