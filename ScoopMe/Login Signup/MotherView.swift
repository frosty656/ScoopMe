//
//  MotherView.swift
//  ScoopMe
//
//  Created by Chris holmes on 12/3/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct MotherView : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "page1" {
                CreateAccount()
            } else if viewRouter.currentPage == "page2" {
                CreateUserDetails()
                    .transition(.scale)
            }
            else if viewRouter.currentPage == "page3" {
                Tabs()
                    .transition(.scale)
            }
        }
    }
}

#if DEBUG
struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
#endif
