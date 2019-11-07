//
//  ManageRideRequests.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/1/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//
import Firebase

func NewRideDeclaration(location: String, amountOfRiders: Int) {
    
    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.uid
    
    if let unwrappedUser = user {
        ref.collection("CurrentRidesRequested").document().setData([
            "Location": location,
            "Driver": unwrappedUser,
            "Time": Calendar.current,
            "Seats": amountOfRiders,
            "Riders": [],
            "isFull": false
        ]){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    } else {
        print("Could not unwrap user ID")
    }
}

func joinRide(ride: Ride){
    let db = Firebase.Firestore.firestore().collection("CurrentRidesOffered")
    
    db.document(ride.id).updateData(
        ["passengers" : FieldValue.arrayUnion([Auth.auth().currentUser!.uid])]
    ){ err in
        if let err = err {
            print("Error updating document: \(err)")
        } else {
            print("Document successfully updated")
        }
    }

    
}
