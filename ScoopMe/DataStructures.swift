import Foundation
import Firebase
import SwiftUI
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

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

struct NormalButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 60)
            .font(.system(.headline))
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}
