//
//  CreateNewUser.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/1/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

func ResetPassword(email: String,  onError:  @escaping (_ errorMessage: String?) -> Void){
    print("Resetting Password")
    Auth.auth().sendPasswordReset(withEmail: email){
        (err) in
        if err != nil {
            onError(err!.localizedDescription)
        }
    }
    print("All done reset")
}

func updateEmail(email: String, onError:  @escaping (_ errorMessage: String?) -> Void){
    Auth.auth().currentUser?.updateEmail(to: email){
        (error) in
        onError(error?.localizedDescription)
    }
}

func CreateUser(email: String, password: String, handler: @escaping AuthDataResultCallback){
    Auth.auth().createUser(withEmail: email, password: password, completion: handler)
}

func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
    Auth.auth().signIn(withEmail: email, password: password, completion: handler)
}

func logOut() {
    try! Auth.auth().signOut()

}

func SetUsersDisplayName(displayName: String, onError:  @escaping (_ errorMessage: String?) -> Void){
    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    changeRequest?.displayName = displayName
    changeRequest?.commitChanges { (error) in
        onError(error?.localizedDescription)
    }
}


func CreateDriverDetails(licencePlate: String, car: String, color: String, livesOnCampus: Bool,  onError:  @escaping (_ errorMessage: String?) -> Void){

    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.uid

    if let unwrappedUser = user {
        ref.collection("Drivers").document(unwrappedUser).setData([
            "licencePlateNumber": licencePlate,
            "carBrand": car,
            "colorOfCar": color,
            "livesOnCampus": livesOnCampus
        ]){ err in
            if let err = err {
                onError(err.localizedDescription)
                print("Error writing driver info: \(err)")
            } else {
                print("Driver info successfully created!")
            }
        }
    } else {
        print("Could not unwrap email")
    }
}


func CreateUserDetailsDocument(firstName: String, lastName: String, dorm: String,onError:  @escaping (_ errorMessage: String?) -> Void){
    let ref = Firestore.firestore()
    let user = Auth.auth().currentUser?.uid

    if let unwrappedUser = user {
        ref.collection("Users").document(unwrappedUser).setData([
            "first_name": firstName,
            "last_name": lastName,
            "Dorm": dorm
        ]){ err in
            if let err = err {
                onError(err.localizedDescription)
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
        print("Could not unwrap UID")
    }
}

func uploadProfilePicture(profileImage: UIImage, handler: @escaping AuthDataResultCallback){
    let storage = Storage.storage()
    let user = Auth.auth().currentUser?.uid
    
    storage.reference().child(user!).putData(profileImage.jpegData(compressionQuality: 0.1)!, metadata: nil){
        (_,error) in
        if error != nil{
            print(error!.localizedDescription)
        } else {
            print("SUCCESS")
        }
    }
    
}
