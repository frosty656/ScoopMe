//
//  FancyLogin.swift
//  ScoopMe
//
//  Created by Chris holmes on 10/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct FancyLogin: View {
        @State var name = ""
        @State var email = ""
        @State var pass = ""
        @State var passconf = ""
        @State var license = ""
        
        var cg = CGFloat(8)
        var cg2 = CGFloat(12)
        
        var body: some View {
            
            ZStack(alignment: .leading){
                
                Image("NightImage")
                    .resizable()
                    .scaledToFit()
                    .position(x:207, y: 50)
                    
                Text("ScoopMe")
                    .foregroundColor(.white)
                    .font(.title)
                    .position(x:80, y:20)

                VStack(){
                        
                        
                        TextField("First Name", text: $email)
                            .padding(cg)
                            .background(Color(.systemGray3))
                            .font(.subheadline)
                            .clipShape(RoundedRectangle(cornerRadius: cg))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        TextField("Email", text: $email)
                            .padding(cg)
                            .background(Color(.systemGray3))
                            .font(.subheadline)
                            .clipShape(RoundedRectangle(cornerRadius: cg))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        
                        TextField("New Password", text: $pass)
                            .padding(cg)
                            .background(Color(.systemGray3))
                            .font(.subheadline)
                            .clipShape(RoundedRectangle(cornerRadius: cg))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        TextField("Confirm Password", text: $passconf)
                        .padding(cg)
                        .background(Color(.systemGray3))
                        .font(.subheadline)
                        .clipShape(RoundedRectangle(cornerRadius: cg))
                        .multilineTextAlignment(.center)
                        .padding()
                        
                        TextField("License Number", text: $license)
                        .padding(cg)
                        .background(Color(.systemGray3))
                        .font(.subheadline)
                        .clipShape(RoundedRectangle(cornerRadius: cg))
                        .multilineTextAlignment(.center)
                        .padding()
                        
                        Button(action: {}){
                            Text("Create")
                                .foregroundColor(Color.init(red: 30/255, green: 50/255, blue: 70/255))
                                .padding()
                                .background(Color.init(red: 255/255, green: 255/255, blue: 255/255))
                              .clipShape(RoundedRectangle(cornerRadius: cg))
                            
                        }
                
                    }
                    .padding()
                }
                .background(Color.init(red: 30/255, green: 50/255, blue: 70/255))
          
    }
}

struct FancyLogin_Previews: PreviewProvider {
    static var previews: some View {
        FancyLogin()
    }
}
