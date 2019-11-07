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

struct Ride: Identifiable {
    let id: String
    let driver: String
    let riders: [String]
    let seats: Int
    let location: String
}
