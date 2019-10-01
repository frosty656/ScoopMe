//
//  ManageRideRequests.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/1/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth


func NewRideRequest(location: String) {

    
    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.email
    
    if let unwrappedUser = user {
        ref.collection("CurrentRidesRequested").document(unwrappedUser).setData(["Location": location]){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    } else {
        print("Could not unwrap email")
    }
}
