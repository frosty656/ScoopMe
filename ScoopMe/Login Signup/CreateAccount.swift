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
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var dorm: String = ""
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var errorText: String = " "
    @State var becomeDriver = false // toggle state

    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("\(self.errorText)")
                
                //UIImagePickerController
                
                TextField("first name", text: $firstName)
                TextField("last name", text: $lastName)
                TextField("dorm", text: $dorm)
                
                TextField("SNHU Email", text: $emailAddress)
                SecureField("Password", text: $password)
                SecureField("Password", text: $passwordConfirm)
                
                Toggle("I want to be a driver", isOn: $becomeDriver)
                
                //If success and wants to be driver go to create driver page
                
                //If success and no driver then go to homepage
                Button(action: {
                    CreateUserDetailsDocument(firstName: self.firstName, lastName: self.lastName, dorm: self.dorm)
                    
                }) {
                    Text("Create Account")
                }
                
                NavigationLink("Login", destination: LoginPage())
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            }
        }
    }
    
//    func CreateUser(email: String, password: String, fullName: String) {
//        self.errorText = ""
//
//           Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//
//            guard let user = authResult?.user, error == nil else {
//
//                let errorText: String  = error?.localizedDescription ?? "unknown error"
//                self.errorText = errorText
//                print(self.errorText)
//              return
//            }
//
//            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//            changeRequest?.displayName = fullName
//            changeRequest?.commitChanges { (error) in
//              // ...
//            }
//
//            print("\(user.email!) created")
//        }
//    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
