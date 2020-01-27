import Foundation
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
    let dorm: String
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
    let destination: String
    let leaveTime: Date
}
