import Foundation
import Firebase
struct LocationData : Identifiable {
    var id: String
    var name: String
    var longitude: Double
    var latitude: Double
}

struct User: Identifiable {
    let id: String
    let firstName: String
    let lastName: String
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
    let locationName: String
    let destinationName: String
    let locationGeoPoint: GeoPoint
    let destinationGeoPoint: GeoPoint
    let leaveTime: Date
}
