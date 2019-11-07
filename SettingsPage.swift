//
//  SettingsPage.swift
//  RideShare
//
//  Created by Chris holmes on 10/21/19.
//  Copyright © 2019 Chris holmes. All rights reserved.
//

import SwiftUI

struct SettingsPage: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
            
        NavigationView(){
            ZStack(){
                Color.init(red: 30/255, green: 50/255, blue: 70/255)
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        NavigationLink(destination: ChangeDorm()){
                            Text("Become a ScoopMe Driver")
                            .padding()
                            Divider()
                        }
                        
                        NavigationLink(destination: ChangeEmail()){
                            Text("Update Email")
                            .padding()
                            Divider()
                        }
                        
                        NavigationLink(destination: ChangeNumber()){
                            Text("Update Password")
                            .padding()
                            Divider()
                        }
                        
                        NavigationLink(destination: ChangeNumber()){
                            Text("Update Phone Number")
                            .padding()
                            Divider()
                        }
                        
                        NavigationLink(destination: ChangeDorm()){
                            Text("Update Dorm Building")
                            .padding()
                            Divider()
                        }
                        
                        NavigationLink(destination: ChangeDorm()){
                            Text("Update Car Details")
                            .padding()
                            Divider()
                        }
                        
                    }
                        
                    .background(Color(.systemGray4))
                }
            .position(x:205 ,y:220)
            .navigationBarTitle("Settings")
            }

        }
        
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

