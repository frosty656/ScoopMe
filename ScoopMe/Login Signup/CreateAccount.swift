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
            
            Text(self.errorText)
            
            TextField("SNHU Email", text: $emailAddress)
            SecureField("Password", text: $password)
            SecureField("Password", text: $passwordConfirm)
            
            
            
            Button(action: {
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
                
            }) {
                NextButtonContent()
            }
            //If success and wants to be driver go to create driver page
            
            //If success and no driver then go to homepage
            
            
            Button(action: {self.viewRouter.currentPage = "Login"}){
                    Text("Login")
            }
            
        }
    }
}

#if DEBUG
struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount().environmentObject(ViewRouter())
    }
}
#endif

struct NextButtonContent : View {
    var body: some View {
        return Text("Create Account")
    }
}

