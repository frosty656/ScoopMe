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
                Text("Welcome to ScoopMe")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(Color(.systemBlue))
                
                Text("Sign in to continue")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Text("\(errorText)")
                
                VStack(spacing: 30){
                    
                    TextField("Email Address", text: $emailAddress)
                        .padding(10)
                        .font(.subheadline)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.systemBlue), lineWidth: 1))
                        
                    SecureField("Password", text: $password)
                        .padding(10)
                        .font(.subheadline)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.systemBlue), lineWidth: 1))
                        
                }//.padding(.vertical, 50)
                //.padding(20)
                
                Button("Login"){
                    logIn(email: self.emailAddress, password: self.password){
                        (result, error) in
                        if error != nil{
                            self.errorText = error!.localizedDescription
                        } else {
                            self.viewRouter.currentPage = "Tabs"
                        }
                    }
                    
                }.buttonStyle(NormalButton())
                
                HStack {
                    Text("New User?")
                        .font(.subheadline)
                        .foregroundColor(Color(.gray))
                    Button(action: {self.viewRouter.currentPage = "CreateAccount"}){
                            Text("Create Account")
                                .font(.subheadline)
                    }
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
