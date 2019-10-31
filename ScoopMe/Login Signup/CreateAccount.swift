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
    
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var errorText: String = ""

    
    var body: some View {
        NavigationView{
            VStack{
                
                Text(self.errorText)
                
                TextField("SNHU Email", text: $emailAddress)
                SecureField("Password", text: $password)
                SecureField("Password", text: $passwordConfirm)
                
                
                Button(action: {
                    self.CreateUser(email: self.emailAddress, password: self.password)
                    
                }) {
                    Text("Create Account")
                }
                
                NavigationLink("Login", destination: LoginPage())
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            }
        }
    }
    
    func CreateUser(email: String, password: String) {
        self.errorText = ""
        
           Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
             
                let errorText: String  = error?.localizedDescription ?? "unknown error"
                self.errorText = errorText
                print(self.errorText)
              return
            }
            
            print("\(user.email!) created")
        }
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
