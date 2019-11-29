//
//  ProfilePicture.swift
//  ScoopMe
//
//  Created by Jacob Frost on 9/17/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ProfilePicture: View {
    
    @ObservedObject var imageLink: getProfileImage
    
    init(userID: String? = ""){
        if userID == ""{
            imageLink = getProfileImage()
        } else {
            imageLink = getProfileImage(userID: userID)
        }
        
    }

    var body: some View {
        VStack(){

            if(imageLink.pathString != ""){
                AnimatedImage(url: URL(string: imageLink.pathString)!)
                //.placeholder(UIImage(named: "User"))
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            } else {
                
            }
        }
    }
}

struct loader : UIViewRepresentable{
    func makeUIView(context: UIViewRepresentableContext<loader>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: loader.UIViewType, context: UIViewRepresentableContext<loader>) {
        
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}
