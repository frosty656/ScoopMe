//
//  ChangePassword.swift
//  RideShare
//
//  Created by Chris holmes on 10/24/19.
//  Copyright © 2019 Chris holmes. All rights reserved.
//

import SwiftUI

struct ChangePassword: View {
    
    @State var pass = ""
    @State var newPass = ""
    @State var newPass2 = ""
    
    var cg = CGFloat(8)
    
    var body: some View {
        ZStack(){
            Color.init(red: 30/255, green: 50/255, blue: 70/255)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                    Text("Change Password")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    
                    TextField("Enter Current Password", text: $pass)
                    .padding(cg)
                    .background(Color(.systemGray3))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: cg))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    TextField("Enter New Password", text: $newPass)
                    .padding(cg)
                    .background(Color(.systemGray3))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: cg))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    TextField("Confirm New Password", text: $newPass2)
                    .padding(cg)
                    .background(Color(.systemGray3))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: cg))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    Button(action: {}){
                        Text("Update")
                            .foregroundColor(Color.init(red: 30/255, green: 50/255, blue: 70/255))
                            .padding()
                            .background(Color.init(red: 255/255, green: 255/255, blue: 255/255))
                          .clipShape(RoundedRectangle(cornerRadius: cg))
                        
                    }
                .padding()
                    
            }
            .background(Color.init(red: 30/255, green: 50/255, blue: 70/255))
        }
    }
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
