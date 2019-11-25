//
//  ManageRideRequests.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/1/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//
import Firebase

func NewRideDeclaration(ride: Ride) {
    
    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.uid
    
    if let unwrappedUser = user {
        ref.collection("Rides").document().setData([
            "Location": ride.location,
            "Driver": ["ID": unwrappedUser, "Name": Auth.auth().currentUser!.displayName],
            "LeavingTime": ride.leaveTime,
            "Seats": ride.seats,
            "Riders": []
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
    let db = Firebase.Firestore.firestore().collection("Rides")
    let currentUser = Auth.auth().currentUser!
    
    
    let item = ["RiderName": currentUser.displayName, "RiderID": currentUser.uid]
    
    db.document(ride.id).updateData(
        ["Riders" : FieldValue.arrayUnion([item])]
    ){ err in
        if let err = err {
            print("Error updating document: \(err)")
        } else {
            print("Document successfully updated")
        }
    }
}

