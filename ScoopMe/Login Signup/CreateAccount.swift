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
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var errorText: String = ""
    @State var becomeDriver = false // toggle state
    @State private var isAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text(self.errorText)
                
                TextField("SNHU Email", text: $emailAddress)
                SecureField("Password", text: $password)
                SecureField("Password", text: $passwordConfirm)
                
                Toggle("I want to be a driver", isOn: $becomeDriver)
                
                Button(action: {
                    CreateUser(email: self.emailAddress, password: self.password){
                        (result, error) in
                        if error != nil{
                            self.errorText = error!.localizedDescription
                            self.isAlert = true
                            return
                        } else {
                            //GO TO CREATE USER DETAILS
                            self.viewRouter.currentPage = "page2"
                            self.emailAddress = ""
                            self.password = ""
                            self.passwordConfirm = ""
                        }
                    }
                    
                }) {
                    NextButtonContent()
                }.alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Error"), message: Text("Invalid Credentials Please Try Again"), dismissButton: .default(Text("Okay")))
                }
                //If success and wants to be driver go to create driver page
                
                //If success and no driver then go to homepage
                
                
                NavigationLink("Login", destination: LoginPage())
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            }
        }
    }
}

#if DEBUG
struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount().environmentObject(ViewRouter())
    }
}
#endif

struct NextButtonContent : View {
    var body: some View {
        return Text("Create Account")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

