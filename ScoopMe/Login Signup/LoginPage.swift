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
    @State var resetPasswordUp = false
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var errorText: String = ""
    @State var value: CGFloat = 0
    
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
                
                Button("Login") {
                    logIn(email: self.emailAddress, password: self.password){
                        (result, error) in
                        if error != nil{
                            self.errorText = error!.localizedDescription
                        } else {
                            self.viewRouter.currentPage = "Tabs"
                        }
                    }
                }
                    
                
                
                Button("Create Account"){
                        self.viewRouter.currentPage = "CreateAccount"
                }
                Text("")
                Button(action: {
                    self.resetPasswordUp.toggle()
                }){
                    Text("Reset Password")
                }.sheet(isPresented: $resetPasswordUp, content: {ResetPasswordView()})
            }
            .padding()
        }
    }
}

struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
