//
//  MotherView.swift
//  ScoopMe
//
//  Created by Chris holmes on 12/3/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct MotherView : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "CreateAccount" {
                CreateAccount()
            } else if viewRouter.currentPage == "UserDetails" {
                CreateUserDetails()
                    .transition(.fade)
            }
            else if viewRouter.currentPage == "Tabs" {
                Tabs()
                    .transition(.scale)
            } else if viewRouter.currentPage == "Login" {
                LoginPage()
                    .transition(.fade)
            }
            else if viewRouter.currentPage == "PasswordReset" {
                ResetPasswordView()
                    .transition(.fade)
            }
            
            
            
            
        }
    }
}

#if DEBUG
struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
#endif
