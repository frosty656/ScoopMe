import Firebase

struct LocationData : Identifiable {
    var id: String
    var name: String
    var longitude: Double
    var latitude: Double
    var distance: Double
}

struct User: Hashable {
    let firstName: String
    let lastName: String
    let dorm: String
}



struct Driver: Hashable
{
    let car: String
    let licencePlate: String
    let seats: Int
    let age: Int
//        let profilePicture: Image?
//        let carImage: Image?
}

struct usersName: Hashable {
    let firstName: String
    let lastName: String
}

struct Ride: Identifiable {
    let id: String
    let driver: [String: String]
    let riders: [[String: String]]
    let seats: Int
    let location: String
    let leaveTime: Date
}
