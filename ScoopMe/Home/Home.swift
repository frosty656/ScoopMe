//
//  Home.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/19/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct Home: View {
    let locations = getTopLocations()
    var body: some View {
        VStack(){
            //List(content: locations)
            Text("List goes here")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
