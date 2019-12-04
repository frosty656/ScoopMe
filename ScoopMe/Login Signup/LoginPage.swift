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
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var presentationMode
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var errorText: String = ""
    
    init(){
        let user = Auth.auth().currentUser?.uid
        
        if user != nil {
            do {
                logOut()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack(){
                Text("\(errorText)")
                
                TextField("SNHU Email", text: $emailAddress)
                SecureField("Password", text: $password)
                
                Button(action:{
                    logIn(email: self.emailAddress, password: self.password){
                        (result, error) in
                        if error != nil{
                            self.errorText = error!.localizedDescription
                        } else {
                            self.viewRouter.currentPage = "page3"
                        }
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
}

struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
