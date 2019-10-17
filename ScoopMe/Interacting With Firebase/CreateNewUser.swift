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

func CreateUser(email: String, password: String){
    
    Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
        if error == nil {
            print("User was created successfully")
        } else {
            print("User creation failed: ")
        }
    }
}

func CreateDriverDetails(licencePlate: String, licence: String, car: String, color: String){
    
    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.email
    
    if let unwrappedUser = user {
        ref.collection("Drivers").document(unwrappedUser).setData([
            "licencePlateNumber": licencePlate,
            "licence": licence,
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


func CreateUserDetails(firstName: String, lastName: String, dorm: String){
    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.email
    
    if let unwrappedUser = user {
        ref.collection("Users").document(unwrappedUser).setData([
            "firstName": firstName,
            "lastName": lastName,
            "dorm": dorm,
        ]){ err in
            if let err = err {
                print("Error writing user info: \(err)")
            } else {
                print("User info successfully created!")
            }
        }
    } else {
        print("Could not unwrap email")
    }
}
