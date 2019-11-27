import Firebase
import SwiftUI

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
                    latitude: i.get("latitude") as! Double,
                    distance: i.get("Distance") as! Double)
                self.data.append(nameData)
            }
        }
    }
}

class getCurrentUserInformation : ObservableObject {
    @Published var user: User = User(firstName: "", lastName: "", dorm: "")

    var currentUser = Auth.auth().currentUser?.uid

    init(){
        let db = Firebase.Firestore.firestore().collection("Users")

        if currentUser == nil {
            print("User Not singed in")
            return
        }
        
        db.document(currentUser!).getDocument{
            (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }

            if let document = snap {
                print("USER PROFILE INFO GATHERED")
                self.user = User(
                    firstName: document.get("first_name") as! String,
                    lastName: document.get("last_name") as! String,
                    dorm: document.get("Dorm") as! String)
            }
            else {
                print("User does not exist")
            }
        }
    }
}

class getCurrentRides : ObservableObject{
    @Published var data = [Ride]()
    
    init(){
        let db = Firebase.Firestore.firestore().collection("Rides").whereField("LeavingTime", isGreaterThan: Timestamp())
        
        db.addSnapshotListener{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            self.data.removeAll()
            for i in snap!.documents{
                let nameData = Ride(
                    id: i.documentID,
                    driver: i.get("Driver") as! [String: String],
                    riders: i.get("Riders") as! [[String: String]],
                    seats: i.get("Seats") as! Int,
                    location: i.get("Location") as! String,
                    leaveTime: (i.get("LeavingTime") as! Timestamp).dateValue()
                )
                self.data.append(nameData)
            }
        }
    }
}



class getUsersName : ObservableObject{
    @Published var user: usersName = usersName(
    firstName: "",
    lastName: "")

    init(userID: String){
        let db = Firebase.Firestore.firestore().collection("Users").document(userID)

                db.getDocument { (document, error) in
                    if let document = document, document.exists {
                        self.user = (usersName(
                            firstName: document.get("first_name") as! String,
                            lastName: document.get("last_name") as! String))
                    } else {
                        //Throw error
                        self.user = (usersName(
                        firstName: "User Does Not Exist",
                        lastName: ""))
                    }
        }
    }
}


class getMulptipleUsersNames : ObservableObject{
    @Published var user = [usersName]()

    init(userID: [String]){
        userID.forEach{
        let db = Firebase.Firestore.firestore().collection("Users").document($0)
                db.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let firstName = document.get("first_name") as! String
                        let lastName = document.get("last_name") as! String
                        self.user.append(usersName(
                            firstName: firstName,
                            lastName: lastName))
                    } else {
                        self.user.append(usersName(
                        //id: "",
                        firstName: "User Does Not Exist",
                        lastName: ""))
                    }
                }
        }
    }
}

class GetUserInformation : ObservableObject{
    @Published var user: User = User(firstName: "", lastName: "", dorm: "")

    init(currentUser: String){
        let db = Firebase.Firestore.firestore().collection("Users")
        
        db.document(currentUser).getDocument{
            (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }

            if let document = snap {
                print("USER PROFILE INFO GATHERED")
                self.user = User(
                    firstName: document.get("first_name") as! String,
                    lastName: document.get("last_name") as! String,
                    dorm: document.get("Dorm") as! String)
            }
            else {
                print("User does not exist")
            }
        }
    }
}

class getImage : ObservableObject {
    @Published var data: Data = nil

    init(){
        // the path to the image
        let id = Auth.auth().currentUser!.uid
        let url = "\(id)"
        let storage = Storage.storage()
        let ref = storage.reference().child(url)
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("\(error)")
                return
            }
            
            print(data)
            self.data = data!
            
        }
    }
}
