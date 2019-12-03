//
//  ViewRouter.swift
//  ScoopMe
//
//  Created by Chris holmes on 12/3/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "page1" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
}
