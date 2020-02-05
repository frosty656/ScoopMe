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
            "locationName": ride.locationName,
            "locationGeoPoint": ride.locationGeoPoint,
            "destinationName": ride.destinationName,
            "destinationGeoPoint": ride.destinationGeoPoint,
            "driver": ["ID": unwrappedUser, "Name": Auth.auth().currentUser!.displayName],
            "leaveTime": ride.leaveTime,
            "seats": ride.seats,
            "riders": []
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
    
    let item = ["riderName": currentUser.displayName, "riderID": currentUser.uid]
    
    db.document(ride.id).updateData(
        ["riders" : FieldValue.arrayUnion([item])]
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
        let db = Firebase.Firestore.firestore().collection("Rides").whereField("leaveTime", isGreaterThan: Timestamp())
        
        db.addSnapshotListener{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            self.data.removeAll()
            for i in snap!.documents{
                print(i.documentID)
                let nameData = Ride(
                    id: i.documentID,
                    driver: i.get("driver") as! [String: String],
                    riders: i.get("riders") as! [[String: String]],
                    seats: i.get("seats") as! Int,
                    locationName: i.get("locationName") as! String,
                    destinationName: i.get("destinationName") as! String,
                    locationGeoPoint: i.get("locationGeoPoint") as! GeoPoint,
                    destinationGeoPoint: i.get("destinationGeoPoint") as! GeoPoint,
                    leaveTime: (i.get("leaveTime") as! Timestamp).dateValue()
                )
                self.data.append(nameData)
            }
        }
    }
}
