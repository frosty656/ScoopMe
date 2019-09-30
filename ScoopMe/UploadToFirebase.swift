//
//  UploadToFirebase.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/26/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

func NewRideRequest() {
    
    let userID = "NewUserID"
    let username = "NewUsername"
//    let title = "Here is a title"
//    let body = "Here is the body of the item"
    
    let ref = Database.database().reference()


    ref.child("database/Users/\(userID)/username").setValue(username)
}

struct UploadToFirebase: View {
    var body: some View {
        VStack(){
            Button(action: {NewRideRequest()}) {
                Text("Hello")
            }
            
        }
    }
}

struct UploadToFirebase_Previews: PreviewProvider {
    static var previews: some View {
        UploadToFirebase()
    }
}
