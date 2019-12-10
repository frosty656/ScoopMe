//
//  SettingsView.swift
//  ScoopMe
//
//  Created by Jacob Frost on 12/5/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI


struct SettingsView: View{
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var settingsVisible
    @State var viewIsUp = false

    var body: some View{
        
       // NavigationView{
            VStack{
                
                List{
                    
                    Button("Reset Password"){
                        self.viewIsUp.toggle()
                    }.sheet(isPresented: $viewIsUp, content: {ResetPasswordView()})
                    
                    NavigationLink(destination: ChangeEmailView()){
                        Text("Change Email")
                    }
                    
                    NavigationLink(destination: ChangeProfileImage()){
                        Text("Change Profile Image")
                    }
                        
                    NavigationLink(destination: ChangeDormView()){
                        Text("Change Dorm")
                    }

                    NavigationLink(destination: ChangeNameView()){
                        Text("Change Name")
                        }
                        
                    Button(action: {
                        self.settingsVisible.wrappedValue.dismiss()
                        self.viewRouter.currentPage = "Login"
                    }){
                        Text("Sign Out")
                    }
                }

            }
            .navigationBarTitle("Settings")
       // }

    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
