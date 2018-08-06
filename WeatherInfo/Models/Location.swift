//
//  Location.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 6/30/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {

    private enum Keys {

        static let name = "name"
        static let latitude = "latitude"
        static let longitude = "longitude"

    }

    // MARK: - Properties

    let name: String
    let latitude: Double
    let longitude: Double

    // MARK: -

    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }

    // MARK: -

    var asDictionary: [String: Any] {
        return [ Keys.name: name,
                 Keys.latitude : latitude,
                 Keys.longitude: longitude ]
    }

}

extension Location {

    // MARK: - Initialization

    init?(dictionary: [String: Any]) {
        guard let name = dictionary[Keys.name] as? String else { return nil }
        guard let latitude = dictionary[Keys.latitude] as? Double else { return nil }
        guard let longitude = dictionary[Keys.longitude] as? Double else { return nil }

        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

}

extension Location: Equatable {

    static func ==(lhs: Location, rhs: Location) -> Bool {
        return
            lhs.name == rhs.name &&
                lhs.latitude == rhs.latitude &&
                lhs.longitude == rhs.longitude
    }

}
