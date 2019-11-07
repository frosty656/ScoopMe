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
    
    @Environment(\.presentationMode) var presentationMode
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var errorText: String = ""
    
    var body: some View {
        NavigationView{
            VStack(){
                Text("\(errorText)")
                
                TextField("SNHU Email", text: $emailAddress)
                SecureField("Password", text: $password)

                //On success go to homepage
                
                Button(action:{
                    self.signUserIn(email: self.emailAddress, password: self.password)
                    if self.errorText == "" {
                    }
                }) {
                    Text("Login")
                }
                

                NavigationLink("Create Account",destination: CreateAccount())
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }.padding()
        }
    }
   func signUserIn(email: String, password: String) {
       Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error
            {
               self.errorText = error.localizedDescription
            } else {
                print("User singed in")
        }
        

       }
   }
}

struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
