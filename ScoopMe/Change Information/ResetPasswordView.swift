//
//  ResetPassword.swift
//  ScoopMe
//
//  Created by Jacob Frost on 12/4/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var email: String = ""
    @State var errorMessage: String = ""
    var body: some View {
        VStack(){
            TextField("Email", text: $email)
            
            Button(action: {
                ResetPassword(email: self.email){
                    (err) in
                    if err != nil {
                        self.errorMessage = err!
                    }
                }
                
            }){
                Text("Reset Password")
            }
        }.padding()
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
