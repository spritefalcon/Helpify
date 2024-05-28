/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var hours: String
    var org: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var phone: String
    var website: String

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case Weekends = "Weekends"
        case Retail = "Retail"
        case ThreeHours = "Three Hours"
        case TwelveFourteen = "12 to 14"
        case Fun = "Fun"
        case Cause = "Highly Rated"
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
