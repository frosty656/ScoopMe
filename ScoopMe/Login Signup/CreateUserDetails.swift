//
//  CreateUserDetails.swift
//  ScoopMe
//
//  Created by Jacob Frost on 11/26/19.
//  Copyright © 2019 Jacob Frost. All rights reserved.
//

import SwiftUI
import FirebaseStorage

struct CreateUserDetails: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var shown = false
    @State var userIsCommuter = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var dorm: String = ""
    @State var errorMessage: String = ""
    @State var profileImage = UIImage()
    
    var body: some View {
        VStack{
            Image(uiImage: profileImage)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .clipped()
            
            Button(action: {
                self.shown.toggle()
            }){
                Text("Upload Profile Picture")
            }.sheet(isPresented: $shown){
                imagePicker(isPresented: self.$shown, selectedImage: self.$profileImage)
            }
            
            TextField("first name", text: $firstName)
            
            TextField("last name", text: $lastName)
            
            Toggle(isOn: $userIsCommuter) {
                Text("I am a commuter")
            }.padding()
            
            if(userIsCommuter){
                TextField("dorm", text: $dorm)
            }
            
            Button(action: {
                
                
                
                if(self.userIsCommuter){
                    if(self.firstName.isEmpty || self.lastName.isEmpty){
                        self.errorMessage = "Please enter all information"
                        return
                    }
                    self.dorm = "Commuter"
                } else {
                    if(self.firstName.isEmpty || self.lastName.isEmpty || self.dorm.isEmpty){
                        self.errorMessage = "Please enter all information"
                        return
                    }
                }
                
                CreateUserDetailsDocument(firstName: self.firstName, lastName: self.lastName, dorm: self.dorm){
                    err in
                    self.errorMessage = err!
                }
                
                uploadProfilePicture(profileImage: self.profileImage){
                    (_,error) in
                    if error != nil{
                        print("Error with profile image upload")
                    }
                }
                self.viewRouter.currentPage = "Tabs"
                
                
            }) {
                NextButtonContent()
                
            }
            Spacer()
        }.padding()
    }
    
}

struct CreateUserDetails_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserDetails().environmentObject(ViewRouter())
    }
}

struct imagePicker: UIViewControllerRepresentable{

    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> imagePicker.Coordinator {
        return Coordinator(parent: self)
    }
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        let parent: imagePicker
        
        init(parent: imagePicker){
            self.parent = parent
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage{
                
                self.parent.selectedImage = selectedImage
                print(selectedImage)
            }
            
            self.parent.isPresented = false
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
}

