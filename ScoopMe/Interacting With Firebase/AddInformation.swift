//
//  AddInformation.swift
//  ScoopMe
//
//  Created by Jacob Frost on 10/16/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

func getTopLocations() -> Query{
    let db = Firestore.firestore()
    return db.collection("Locations").limit(to: 50)
}
