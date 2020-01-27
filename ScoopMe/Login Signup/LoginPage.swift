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
            VStack(spacing: 20){
                Text("\(errorText)")
                
                TextField("SNHU Email", text: $emailAddress)
                SecureField("Password", text: $password)
                
                Button(action:{
                    logIn(email: self.emailAddress, password: self.password){
                        (result, error) in
                        if error != nil{
                            self.errorText = error!.localizedDescription
                        } else {
                            self.viewRouter.currentPage = "Tabs"
                        }
                    }
                    
                }) {
                    Text("Login")
                    
                }

                Button(action: {self.viewRouter.currentPage = "CreateAccount"}){
                        Text("Create Account")
                }
                
                NavigationLink(destination: ResetPasswordView()){
                    Text("Reset Password")
                }
            }
        .padding()
            //Move view when keyboard is active
            .offset(y: -self.value / 2)
            .animation(.spring())
            .onAppear{
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main){
                    (noti) in
                    let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    let height = value.height
                    
                    self.value = height
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main){
                    (noti) in
  
                    self.value = 0
                }
            }
        }
    }
}

struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
