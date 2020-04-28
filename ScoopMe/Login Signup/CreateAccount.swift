//
//  CreateAccount.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/24/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import Firebase

struct CreateAccount: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var errorText: String = ""
    
    var body: some View {
        VStack{
            Text("Create an Account")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            Text("Start sharing rides today")
                .font(.caption)
                .font(.system(size: 30))
                .foregroundColor(Color(.systemTeal))
                .bold()
             
            Text(self.errorText)
                .foregroundColor(Color(.systemRed))
            
            VStack(spacing: 30){
                    
                TextField("Email Address", text: $emailAddress)
                    .padding(10)
                    .font(.subheadline)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.systemBlue), lineWidth: 1))
                        
                SecureField("Password", text: $password)
                    .padding(10)
                    .font(.subheadline)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.systemBlue), lineWidth: 1))
                
                SecureField("Confirm password", text: $passwordConfirm)
                    .padding(10)
                    .font(.subheadline)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.systemBlue), lineWidth: 1))
                        
            }.padding(.vertical, 50)

            Button("Create Account") {
                CreateUser(email: self.emailAddress, password: self.password){
                    (result, error) in
                    if error != nil{
                        self.errorText = error!.localizedDescription
                        return
                    } else {
                        //GO TO CREATE USER DETAILS
                        self.viewRouter.currentPage = "UserDetails"
                        self.emailAddress = ""
                        self.password = ""
                        self.passwordConfirm = ""

                    }
                }
            }
            .buttonStyle(NormalButton())
            HStack{
                Text("Already have an account?")
                Button(action: {self.viewRouter.currentPage = "Login"}){
                        Text("Login")
                }
            }
            Spacer()
            
        }.padding()
    }
}

#if DEBUG
struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount().environmentObject(ViewRouter())
    }
}
#endif
