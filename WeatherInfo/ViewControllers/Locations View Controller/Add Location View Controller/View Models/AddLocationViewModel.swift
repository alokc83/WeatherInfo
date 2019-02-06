//
//  AddLocationViewModel.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/6/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import Foundation
import CoreLocation

class AddLocationViewModel {
    var query: String = "" {
        didSet {
            geocode(addressString: query)
        }
    }
    private var querying = false {
        didSet {
            queryingDidChange?(querying)
        }
    }
    private var locations: [Location] = [] {
        didSet {
            locationsDidChange?(locations)
        }
    }
    var numberOfLocations: Int { return locations.count }
    var hasLocations: Bool { return numberOfLocations > 0 }
    
    private lazy var geocoder = CLGeocoder()
    //private let gcoder: LocationService
    
    var queryingDidChange: ((Bool) -> Void)?
    var locationsDidChange: (([Location]) -> Void)?
    
    func locations(at index: Int) -> Location? {
        guard index < locations.count else { return nil }
        return locations[index]
    }
    
    func viewModelForLocation(at index: Int) -> LocationRepresentable? {
        guard let location = locations(at: index) else { return nil }
        return LocationsViewLocationViewModel(location: location.location, locationAsString: location.name)
    }
}

extension AddLocationViewModel {
    func geocode(addressString: String?) {
        guard let addressString = addressString, !addressString.isEmpty else {
            locations = []
            return
        }
        
        querying = true

        geocoder.geocodeAddressString(addressString) { [weak self ](placemarks, error) in
            var locations: [Location] = []
            
            self?.querying = false
            
            if let error = error {
                print("Unable to reverse geo code the address (\(error))")
            } else if let placemarksArr = placemarks {
                locations = placemarksArr.compactMap { (placemark) -> Location? in
                    guard let name = placemark.name, let location = placemark.location else { return nil }
                    return Location(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                }
            }
            self?.locations = locations
        }
    }
}
