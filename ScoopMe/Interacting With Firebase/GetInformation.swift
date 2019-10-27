import Firebase

class getLocations : ObservableObject{
    @Published var data = [LocationData]()
    
    init(){
        let db = Firebase.Firestore.firestore().collection("Locations")
        
        db.addSnapshotListener{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                let nameData = LocationData(
                    id: i.documentID,
                    name: i.get("Location") as! String,
                    longitude: i.get("longitude") as! Double,
                    latitude: i.get("latitude") as! Double)
                self.data.append(nameData)
            }
        }
    }
}

class getUserProfile : ObservableObject {
    @Published var data = [User]()

    var currentUser = Auth.auth().currentUser?.uid

    init(){
        let db = Firebase.Firestore.firestore().collection("Users")

        if currentUser == nil {
            print("User Not singed in")
            return
        }
        
        db.document(currentUser!).addSnapshotListener{
            (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }

            if let document = snap {
                self.data.append(User(
                    firstName: document.get("firstName") as! String,
                    lastName: document.get("lastName") as! String,
                    dorm: document.get("dorm") as! String))
            }
            else {
                print("User does not exist")
            }
        }
    }
}
