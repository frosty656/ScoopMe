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
    
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    
    var body: some View {
        NavigationView{
            VStack{
                
                TextField("SNHU Email", text: $email)
                SecureField("Password", text: $password)
                SecureField("Password", text: $passwordConfirm)
                
                
                Button(action: {createAccount(username: self.email, password: self.password, confirmPassword: self.passwordConfirm)}) {
                    Text("Create Account")
                }
                NavigationLink(destination: LoginPage()){
                    Text("Login")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                
            }
        }
    }
}


func createAccount(username: String, password: String, confirmPassword: String){
    if (username == ""){
        //username cannot be blank
        //return
    }
    if (password == ""){
        //password cannot be blank
        //return
    }
    if (username != "" && password != ""){
        Auth.auth().createUser(withEmail: username, password: password)
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
