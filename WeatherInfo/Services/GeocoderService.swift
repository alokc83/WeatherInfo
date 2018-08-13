//
//  GeocoderService.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/6/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import CoreLocation

class GeocoderService: LocationService {
    private lazy var geocoder = CLGeocoder ()
    
    func geocode(addressString: String?, completionHandler: @escaping LocationService.LocationServiceCompletionHandler) {
        
        guard let addressString = addressString, !addressString.isEmpty else {
            completionHandler([], nil)
            return
        }
        
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            var locations: [Location] = []
            
            if let error = error {
                completionHandler([], error)
                print("Unable to reverse geo code the address (\(error))")
            } else if let placemarksArr = placemarks {
                locations = placemarksArr.compactMap { (placemark) -> Location? in
                    guard let name = placemark.name, let location = placemark.location else { return nil }
                    return Location(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                }
            }
            completionHandler(locations, nil)
        }
    }
}
