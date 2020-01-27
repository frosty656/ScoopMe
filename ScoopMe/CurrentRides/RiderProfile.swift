//
//  RiderProfile.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/24/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct RiderProfile: View {
    @ObservedObject var imageLink = getProfileImage()
    
    @ObservedObject var userInfo: GetUserInformation
    
    init(ride: [String: String]){
        self.userInfo =  GetUserInformation(currentUser: ride["RiderID"]!)
    }
    
    var body: some View {
        NavigationView{
            VStack(){
                
                if(imageLink.pathString != ""){
                    AnimatedImage(url: URL(string: imageLink.pathString)!)
                        .placeholder(UIImage(named: "User"))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                } else {
                    Image(uiImage: UIImage(named: "User")!)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                }
                
                
                Text("\(userInfo.user.firstName)")
                Text("\(userInfo.user.lastName)")
                Text("\(userInfo.user.dorm)")
            }
        }
    }
    
}

struct RiderProfile_Previews: PreviewProvider {
    static var previews: some View {
        RiderProfile(ride: ["Ridername": "Hello"])
    }
}
