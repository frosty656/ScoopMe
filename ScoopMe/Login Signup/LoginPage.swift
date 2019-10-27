//
//  LoginSignUp.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/24/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginPage: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView{
            VStack(){
                TextField("SNHU Email", text: $email)
                SecureField("Password", text: $password)

                Button(action: {CreateUser(email: self.email, password: self.password)}) {
                    Text("Login")
                }
                NavigationLink(destination: CreateAccount()){
                    Text("Create Account")
                        .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
            }.padding()
        }
    }
}


struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
