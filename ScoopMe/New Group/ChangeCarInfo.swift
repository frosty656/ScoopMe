//
//  ChangeCarInfo.swift
//  RideShare
//
//  Created by Chris holmes on 10/27/19.
//  Copyright © 2019 Chris holmes. All rights reserved.
//

import SwiftUI

struct ChangeCarInfo: View {
    
    @State var pass = ""
    @State var newPass = ""
    @State var newPass2 = ""
    
    var cg = CGFloat(8)
    
    var body: some View {
        ZStack(){
            Color.init(red: 30/255, green: 50/255, blue: 70/255)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                    Text("Choose a Vehicle Type")
                        .foregroundColor(.white)
                        .font(.system(size: 25))

                
                HStack(){
                    
                    Button(action: {}){
                        
                        Image("icons8-sedan-51")
                        .padding()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                        .padding()
                        .foregroundColor(Color(.white))
                    }
                    
                    Button(action: {}){
                        Image("icons8-van-50")
                        .padding()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                        .foregroundColor(Color(.white))
                    }
                    
                }
                
                HStack(){
                    VStack(){
                        Button(action:{}){
                            Image("icons8-pickup-50")
                            .padding()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 10)
                            .padding()
                            .foregroundColor(Color(.white))
                        }
                        
                    }
                    
                    Button(action: {
                        Image("icons8-suv-50")
                        .padding()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 5))
                        .shadow(radius: 10)
                        .foregroundColor(Color(.blue))
                        
                    }){
                        Image("icons8-suv-50")
                        .padding()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                        .foregroundColor(Color(.white))
                        
                    }
            
                }
                    
                    Button(action: {}){
                        Text("Update")
                            .foregroundColor(Color.init(red: 30/255, green: 50/255, blue: 70/255))
                            .padding()
                            .background(Color.init(red: 255/255, green: 255/255, blue: 255/255))
                          .clipShape(RoundedRectangle(cornerRadius: cg))
                        
                    }
                .padding()
                    
            }
            .background(Color.init(red: 30/255, green: 50/255, blue: 70/255))
        }
    }
}

struct ChangeCarInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChangeCarInfo()
    }
}
