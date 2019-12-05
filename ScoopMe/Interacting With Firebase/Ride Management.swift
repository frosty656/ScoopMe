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
            "Destination": ride.destination,
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


class getCurrentRides : ObservableObject{
    @Published var data = [Ride]()
    
    init(){
        let db = Firebase.Firestore.firestore().collection("Rides").whereField("LeavingTime", isGreaterThan: Timestamp())
        
        db.addSnapshotListener{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            self.data.removeAll()
            for i in snap!.documents{
                let nameData = Ride(
                    id: i.documentID,
                    driver: i.get("Driver") as! [String: String],
                    riders: i.get("Riders") as! [[String: String]],
                    seats: i.get("Seats") as! Int,
                    location: i.get("Location") as! String,
                    destination: i.get("Destination") as! String,
                    leaveTime: (i.get("LeavingTime") as! Timestamp).dateValue()
                )
                self.data.append(nameData)
            }
        }
    }
}
