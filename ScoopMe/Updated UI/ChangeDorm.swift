//
//  ChangeDorm.swift
//  RideShare
//
//  Created by Chris holmes on 10/24/19.
//  Copyright © 2019 Chris holmes. All rights reserved.
//

import SwiftUI

struct ChangeDorm: View {
    @State var newNumber = ""
    @State private var index = 0
    
    var cg = CGFloat(8)
    
    var dorms = ["Conway", "Hampton", "Kingston", "Lincoln", "Monadnock", "New Castle", "Rockingham", "Tuckerman", "Washington", "Windsor"]
    
    var body: some View {
        ZStack(){
            Color.init(red: 30/255, green: 50/255, blue: 70/255)
            .edgesIgnoringSafeArea(.all)
            Text("Select Dorm Building")
                .foregroundColor(.white)
                .font(.system(size: 25))
                
            VStack{
            
                Picker(selection: $index, label: Text("")){
                    
                    ForEach(0 ..< dorms.count){
                        Text(self.dorms[$0]).tag($0)
                    }
                }
                .foregroundColor(.white)
                .position(x:150, y:350)
                       
               }
               .background(Color.init(red: 30/255, green: 50/255, blue: 70/255))
        }
    }
    
       
}

struct ChangeDorm_Previews: PreviewProvider {
    static var previews: some View {
        ChangeDorm()
    }
}
