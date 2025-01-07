//
//  Configuration.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 6/30/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import Foundation

struct Defaults {

    static let Latitude: Double = 51.400592
    static let Longitude: Double = 4.760970

}

enum API {

    static let APIKey = "abf1b2b1de593ef83e6454af4bed692c"
    static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!

    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }
    
}
