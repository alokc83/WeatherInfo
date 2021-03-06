//
//  WeatherData.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 6/30/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import Foundation

struct WeatherData: Codable {

    let time: Date

    let lat: Double
    let long: Double
    let windSpeed: Double
    let temperature: Double

    let icon: String
    let summary: String

    let dailyData: [WeatherDayData]

}

extension WeatherData: JSONDecodable {

    init(decoder: JSONDecoder) throws {
        self.lat = try decoder.decode(key: "latitude")
        self.long = try decoder.decode(key: "longitude")
        self.dailyData = try decoder.decode(key: "daily.data")

        self.icon = try decoder.decode(key: "currently.icon")
        self.summary = try decoder.decode(key: "currently.summary")
        self.windSpeed = try decoder.decode(key: "currently.windSpeed")
        self.temperature = try decoder.decode(key: "currently.temperature")

        let time: Double = try decoder.decode(key: "currently.time")
        self.time = Date(timeIntervalSince1970: time)
    }

}
