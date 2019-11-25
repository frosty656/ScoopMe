//
//  CreateNewUser.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/1/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

func CreateUser(email: String, password: String, handler: @escaping AuthDataResultCallback){
    Auth.auth().createUser(withEmail: email, password: password, completion: handler)
}

func logIn(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password)
}

func logOut() {
        try! Auth.auth().signOut()

}

func SetUsersDisplayName(displayName: String){
    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    changeRequest?.displayName = displayName
    changeRequest?.commitChanges { (error) in
      // ...
    }
}


func CreateDriverDetails(licencePlate: String, car: String, color: String){

    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.uid

    if let unwrappedUser = user {
        ref.collection("Drivers").document(unwrappedUser).setData([
            "licencePlateNumber": licencePlate,
            "carBrand": car,
            "colorOfCar": color
        ]){ err in
            if let err = err {
                print("Error writing driver info: \(err)")
            } else {
                print("Driver info successfully created!")
            }
        }
    } else {
        print("Could not unwrap email")
    }

}


func CreateUserDetailsDocument(firstName: String, lastName: String, dorm: String){
    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.uid

    if let unwrappedUser = user {
        ref.collection("Users").document(unwrappedUser).setData([
            "first_name": firstName,
            "last_name": lastName,
            "Dorm": dorm,
        ]){ err in
            if let err = err {
                print("Error writing user info: \(err)")
            } else {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = firstName + " " + lastName
                changeRequest?.commitChanges { (error) in
                  // ...
                }
                print("User info successfully created!")
            }
        }
    } else {
        print("Could not unwrap email")
    }
}
