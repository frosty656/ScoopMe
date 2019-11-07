//
//  ChangeEmail.swift
//  RideShare
//
//  Created by Chris holmes on 10/24/19.
//  Copyright © 2019 Chris holmes. All rights reserved.
//

import SwiftUI

struct ChangeEmail: View {
    @State var email = ""
    @State var newEmail1 = ""
    @State var newEmail2 = ""
    
    var cg = CGFloat(8)
    
    var body: some View {
        ZStack(){
            Color.init(red: 30/255, green: 50/255, blue: 70/255)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                    Text("Change Email")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    
                    TextField("Enter Current Email", text: $email)
                    .padding(cg)
                    .background(Color(.systemGray3))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: cg))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    TextField("Enter New Email", text: $newEmail1)
                    .padding(cg)
                    .background(Color(.systemGray3))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: cg))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    TextField("Confirm New Email", text: $newEmail2)
                    .padding(cg)
                    .background(Color(.systemGray3))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: cg))
                    .multilineTextAlignment(.center)
                    .padding()
                    
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

struct ChangeEmail_Previews: PreviewProvider {
    static var previews: some View {
        ChangeEmail()
    }
}
