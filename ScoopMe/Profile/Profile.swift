//
//  Profile.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import Firebase
struct Profile: View {
    @ObservedObject var userInfo = getCurrentUserInformation()
    @State var showSettings = false
    @EnvironmentObject var viewRouter: ViewRouter
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.init(red: 30/255, green: 50/255, blue: 70/255)
                .edgesIgnoringSafeArea(.all)
                
                VStack  (){
                    
                    ProfilePicture()
                        .frame(width: 300, height: 150)
                    
                    HStack(){
                        
                        VStack(){
                            
                            Text((userInfo.user.firstName) + " " + (userInfo.user.lastName))
                                .foregroundColor(.white)
                            Text(userInfo.user.dorm)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    .font(.system(size: 24))
                    
                    Spacer()
                }.padding()
                .navigationBarTitle("Profile")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showSettings.toggle()
                    }){
                        Image("icons8-ios-50")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                        .padding()
                        .foregroundColor(Color(.white))
                    }.sheet(isPresented: $showSettings, content: {SettingsView()})
                )
            }
        }
        
        
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
        
    }
}

struct SettingsView: View{
    
    var body: some View{
        NavigationView{
            ZStack{
                NavigationView{
                    VStack{
                        List{
                            NavigationLink(destination: ResetPasswordView()){
                                Text("Reset Password")
                            }
                        }
                    }
                .navigationBarTitle("Settings")
                }
            }
        }
    }
    
}
