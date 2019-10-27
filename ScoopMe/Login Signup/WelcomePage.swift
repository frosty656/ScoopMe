//
//  WelcomePage.swift
//  ScoopMe
//
//  Created by Chris holmes on 10/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct WelcomePage: View {
    var cg = CGFloat(8)
    
    var body: some View {
        NavigationView(){
                
                VStack{
                    
                    Text("Please choose an option to get started")
                        .font(.body)
                    
                    HStack{
                        
                        NavigationLink(destination: FancyLogin()){
                            Text("Passenger")
                                .foregroundColor(Color.init(red: 30/255, green: 50/255, blue: 70/255))
                                .padding()
                                .background(Color.init(red: 255/255, green: 255/255, blue: 255/255))
                                .clipShape(RoundedRectangle(cornerRadius: cg))
                            .border(Color.init(red: 30/255, green: 50/255, blue: 70/255), width: 3)
                                .cornerRadius(5)
                            
                        }
                        
                        Text("or")
                            .padding()
                        
                        NavigationLink(destination: FancyLogin()){
                            Text("   Driver   ")
                                .foregroundColor(Color.init(red: 30/255, green: 50/255, blue: 70/255))
                                .padding()
                                .background(Color.init(red: 255/255, green: 255/255, blue: 255/255))
                                .clipShape(RoundedRectangle(cornerRadius: cg))
                                .border(Color.init(red: 30/255, green: 50/255, blue: 70/255), width: 3)
                                .cornerRadius(5)
                            
                        }
                    }
                        
                    .padding()
                    NavigationLink(destination: LoginPage()){
                        Text("Already have an account? Click Here")
                        .foregroundColor(.blue)
                    }
                     
                }
            
                .navigationBarTitle("Welcome to RideShare")
            }
        
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
