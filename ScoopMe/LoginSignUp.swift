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

struct LoginSignUp: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        VStack(){
            TextField("SNHU Email", text: $email)
            TextField("Password", text: $password)
            
            Button(action: {CreateUser(email: self.email, password: self.password)}) {
                Text("Login")
            }
        }
    }
}

func Login(username: String, password: String){
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


struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignUp()
    }
}
