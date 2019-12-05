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
                    id: i.documentID+"key",
                    name: i.get("Location") as! String,
                    longitude: i.get("Longitude") as! Double,
                    latitude: i.get("Latitude") as! Double)
                self.data.append(nameData)
            }
        }
    }
}

class getCurrentUserInformation : ObservableObject {
    @Published var user: User = User(id: "", firstName: "", lastName: "", dorm: "", isDriver: false)

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
                    id: self.currentUser!,
                    firstName: document.get("first_name") as! String,
                    lastName: document.get("last_name") as! String,
                    dorm: document.get("Dorm") as! String,
                    isDriver: document.get("isDriver") as! Bool)
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
                    destination: i.get("Destination") as! String,
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
    @Published var user: User = User(id: "", firstName: "", lastName: "", dorm: "", isDriver: false)

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
                    id: currentUser,
                    firstName: document.get("first_name") as! String,
                    lastName: document.get("last_name") as! String,
                    dorm: document.get("Dorm") as! String,
                    isDriver: document.get("isDriver") as! Bool)
            }
            else {
                print("User does not exist")
            }
        }
    }
}

class getProfileImage : ObservableObject {
    @Published var pathString = ""
    
    init(userID: String? = ""){
        
        var user = userID
        if userID == ""{
            print("Getting Current User")
            user = Auth.auth().currentUser!.uid
        }
    
        let storage = Storage.storage().reference()
        
        storage.child(user!).downloadURL{
            (url, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            self.pathString = "\(url!)"
        }
    }
}
