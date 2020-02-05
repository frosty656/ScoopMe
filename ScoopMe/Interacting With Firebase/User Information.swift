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
    @Published var user: User = User(id: "", firstName: "", lastName: "")
    
    var currentUser = Auth.auth().currentUser?.uid

    init(onError:  @escaping (_ errorMessage: String?) -> Void){
        let db = Firebase.Firestore.firestore().collection("Users")
        print("Getting Current User")
        if currentUser == nil {
            print("User Not singed in")
            return
        }
        
        db.document(currentUser!).getDocument{
            (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                onError((err?.localizedDescription)!)
                return
            }
            if snap!.exists{
                if let document = snap {
                    print("Profile Info Gathered")
                    self.user = User(
                        id: self.currentUser!,
                        firstName: document.get("first_name") as! String,
                        lastName: document.get("last_name") as! String)
                }
                else {
                    print("User does not exist")
                }
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
    @Published var user: User = User(id: "", firstName: "", lastName: "")

    init(currentUser: String){
        let db = Firebase.Firestore.firestore().collection("Users")
        
        db.document(currentUser).getDocument{
            (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            if snap!.exists{
                if let document = snap {
                    print("USER PROFILE INFO GATHERED")
                    self.user = User(
                        id: currentUser,
                        firstName: document.get("first_name") as! String,
                        lastName: document.get("last_name") as! String)
                }
                else {
                    print("User does not exist")
                }
            }
        }
    }
}

class getProfileImage : ObservableObject {
    
    @Published var pathString = ""
    
    init(userID: String? = ""){

        //,onError:  @escaping (_ errorMessage: String?) -> Void
        if Auth.auth().currentUser?.uid == nil{
            return
        }

        var user = userID
        if userID == ""{
            print("Getting Current Users Profile Image")
            
            user = Auth.auth().currentUser!.uid
        }
    
        let storage = Storage.storage().reference()
        
        storage.child(user!).downloadURL{
            (url, err) in
            if err != nil {
                print(err!.localizedDescription)
                //onError(err!.localizedDescription)
                return
            }
            self.pathString = "\(url!)"
        }
    }
}


func currentlyLoggedIn() -> String{
    if Auth.auth().currentUser != nil {
      return "Tabs"
    } else {
      return "Login"
    }
}
