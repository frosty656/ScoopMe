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
    @State var image = ""

    var body: some View {
        VStack(){

            if(image != ""){
                AnimatedImage(url: URL(string: image)!)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            } else {
                
            }
        }.onAppear{
            let storage = Storage.storage().reference()
            storage.child(Auth.auth().currentUser!.uid).downloadURL{
                (url, err) in
                if err != nil {
                    print(err!.localizedDescription)
                    return
                }
                self.image = "\(url!)"
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
