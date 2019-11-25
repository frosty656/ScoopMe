//
//  ChangeNumber.swift
//  RideShare
//
//  Created by Chris holmes on 10/24/19.
//  Copyright © 2019 Chris holmes. All rights reserved.
//

import SwiftUI

struct ChangeNumber: View {
    
    @State var newNumber = ""

    var cg = CGFloat(8)
    
    var body: some View {
        ZStack(){
            Color.init(red: 30/255, green: 50/255, blue: 70/255)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                    Text("Change Phone Number")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    
                    TextField("Enter New Phone Number", text: $newNumber)
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

struct ChangeNumber_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNumber()
    }
}
