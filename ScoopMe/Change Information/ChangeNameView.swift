//
//  ChangeNameView.swift
//  ScoopMe
//
//  Created by Jacob Frost on 12/5/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct ChangeNameView: View {
    @State var firstName = ""
    @State var lastName = ""
    
    var body: some View {
        VStack(){
            TextField("first name", text: $firstName)
            TextField("last name", text: $lastName)
            
            Button(action: {
                
            }){
                Text("Confirm")
            }
            
            Spacer()
        }.padding()
    }
}

struct ChangeNameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNameView()
    }
}
