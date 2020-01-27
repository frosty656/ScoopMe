//
//  MainLocationView.swift
//  ScoopMe
//
//  Created by Jacob Frost on 12/28/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI

struct MainLocationView: View {
    @State var locationList = ["Lincoln","Conway","Hampton","Windsor","Tuckerman","Manadnock","Library","Washingtin","New Castle","Kingston","Rockingham"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(0 ..< locationList.count) { landmark in
                    Text(self.locationList[landmark]).tag(landmark)
                }
            }
        }
    }
}

struct MainLocationView_Previews: PreviewProvider {
    static var previews: some View {
        MainLocationView()
    }
}
