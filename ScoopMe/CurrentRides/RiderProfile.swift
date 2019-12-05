//
//  RiderProfile.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/24/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct RiderProfile: View {
    
    @ObservedObject var userInfo: GetUserInformation
    //@ObservedObject var driverInfo: getDriverInformation
    
    init(ride: [String: String]){
        self.userInfo =  GetUserInformation(currentUser: ride["RiderID"]!)
    }
    
    var body: some View {
        NavigationView{
            VStack(){
                
                ProfilePicture(userID: userInfo.user.id)
                
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
