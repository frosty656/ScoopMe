//
//  Passenger.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI


    
struct User: Hashable {
    let firstName: String
    let lastName: String
    let dorm: String
    let car: String
    let licencePlate: String
    let seats: Int
    let age: Int
//        let profilePicture: Image?
//        let carImage: Image?
}

struct CurrentUser{
    static var currentuser = User(firstName: "Jacob", lastName: "Frost", dorm: "Kingston", car: "Ford Escape", licencePlate: "23jfm", seats: 4, age: 21)
}
        
    
struct UserInfo: View {
    
    var body: some View {
        Text("Hello")
    }
}
