//
//  LocationService.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/6/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import Foundation

protocol LocationService {
    typealias LocationServiceCompletionHandler = ([Location], Error?) -> Void
    
    func geocode(addressString: String?, completionHandler: @escaping LocationServiceCompletionHandler)
}
